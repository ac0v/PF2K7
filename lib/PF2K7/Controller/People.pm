package PF2K7::Controller::People;

use Moose;
use namespace::autoclean;

use PF2K7::Form::Login;
use PF2K7::Form::User::Data;

BEGIN { extends "Catalyst::Controller" }

has form_login => (
    isa        => 'PF2K7::Form::Login',
    is         => 'ro',
    default    => sub { PF2K7::Form::Login->new(); },
);
has form_user_register => (
    isa        => 'PF2K7::Form::User::Data',
    is         => 'ro',
    default    => sub { PF2K7::Form::User::Data->new(); },
);
has form_user_profile => (
    isa        => 'PF2K7::Form::User::Data',
    is         => 'ro',
    default    => sub {
        my $form = PF2K7::Form::User::Data->new();
        $form->field('submit')->value('Save');
        return $form;
    },
);

sub login :Local :Args(0) {
    my ($self, $c) = @_;

    my $form = $self->form_login();

    # short return if form is not validated == process returns false value
    return if ! $form->process( params => $c->request()->body_parameters() );

    my $is_authenticated
        = $c->authenticate({
            map {
                $_ => $form->field($_)->value();
            } qw(username password)
          })
        ;

    if ( $is_authenticated ) {
	# $c->response->redirect($c->uri_for(
	# $c->controller('Books')->action_for('list')));
	$c->stash(message => 'Welcome.');
    }
    else {
	$c->stash(message => 'Login failed.');
    }

    return;
}

sub logout :Local :Args(0) {
    my ($self, $c) = @_;

    $c->logout();
    $c->response()->redirect($c->uri_for('/'));

    return;
}

sub register :Local :Args(0) {
    my ($self, $c) = @_;

    # precondition: user is not logged in
    # ToDo: adjust redirect URL
    return $c->response()->redirect($c->uri_for('/')) if $c->user();

    my $form = $self->form_user_register();

    # short return if form is not validated == process returns false value
    return if ! $form->process( params => $c->request()->body_parameters() );

    # ToDo: add a check for duplicate usernames

    # eval is used to catch all common errors
    eval {
        $c->model('PF2K7::User')->create({
            map {
                $_ => defined $form->field($_)->value() ? $form->field($_)->value() : q{};
            } qw( username password name email motto1 motto2 likes dislikes gps
                  enneagram1 enneagram2 )
        });
    };

    if ( ! $@ ) {
        my $is_authenticated
            = $c->authenticate({
                map {
                    $_ => $form->field($_)->value();
                } qw(username password)
              })
            ;

        if ( $is_authenticated ) {
            $c->stash(message => 'Registration succeeded.');
            $c->go('/pf/home');

            return;
        }
    }
    else {
        $c->log()->error($@);
    }

    $c->stash(message => 'Registration Failed.');

    return;
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 NAME

PF2K7::Controller::People - People Controller for PF2K7

=head1 DESCRIPTION

Handles authentication.

=head1 METHODS

=head1 AUTHOR

Paul Johnson, paul@pjcj.net

=head1 LICENSE

Copyright 2010, Paul Johnson (paul@pjcj.net).

This software is free.  It is licensed under the same terms as Perl itself.

=cut
