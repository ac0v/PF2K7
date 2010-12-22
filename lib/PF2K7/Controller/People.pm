package PF2K7::Controller::People;

use Moose;
use namespace::autoclean;

BEGIN { extends "Catalyst::Controller" }

sub index :Path :Args(0)
{
    my ($self, $c) = @_;

    $c->response->body("Matched PF2K7::Controller::People in People.");
}

sub login :Local :Args(0)
{
    my ($self, $c) = @_;

    my $name = $c->req->params->{name};

    $c->log->debug("name is [$name]");

    $c->stash
    (
        name => $name,
    );
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
            username => $params->{username},
            email    => $params->{email},
            password => $params->{password},
        });
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
