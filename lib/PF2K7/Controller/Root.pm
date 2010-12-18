package PF2K7::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends "Catalyst::Controller" }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => "");

sub index :Path :Args(0)
{
    my ($self, $c) = @_;
    $c->go("/pf/home");
}

sub default :Path {
    my ($self, $c) = @_;
    $c->response->body("Page not found");
    $c->response->status(404);
}

sub end : ActionClass('RenderView') {}

sub json : Local
{
    my ($self, $c) = @_;
    $c->forward("index");
    $c->stash->{current_view} = "JSON";
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 NAME

PF2K7::Controller::Root - Root Controller for PF2K7

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/).

=head2 end

Attempt to render a view, if needed.

=head2 default

Standard 404 error page.

=head2 json

JSON output.

=head1 AUTHOR

Paul Johnson, paul@pjcj.net

=head1 LICENSE

Copyright 2010, Paul Johnson (paul@pjcj.net).

This software is free.  It is licensed under the same terms as Perl itself.

=cut
