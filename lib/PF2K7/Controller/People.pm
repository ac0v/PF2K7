package PF2K7::Controller::People;

use Moose;
use namespace::autoclean;

use PF2K7::Form::Login;

BEGIN { extends "Catalyst::Controller" }

has form_login => (
    isa        => 'PF2K7::Form::Login',
    is         => 'ro',
    default    => sub { PF2K7::Form::Login->new(); },
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

sub logout :Local :Args(0)
{
    my ($self, $c) = @_;

    $c->logout;
    $c->response->redirect($c->uri_for('/'));
}

sub register :Local :Args(0)
{
    my ($self, $c) = @_;

    if (lc $c->req->method eq "post")
    {
        my $params   = $c->req->params;
        my $users_rs = $c->model("PF2K7::User");
        my $newuser  = $users_rs->create
        ({
            map { $_ => $params->{$_} }
                qw( username password name email motto1 motto2 likes dislikes
                    gps enneagram1 enneagram2 )
        });

        unless ($c->authenticate({ username => $params->{username},
                                   password => $params->{password} }))
        {
            $c->stash(message => "Registration failed.");
            return;
        }

        $c->stash(message => "Registration succeeded.");
        $c->go("/pf/home");
    }
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
