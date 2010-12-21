package PF2K7::Controller::PF;

use Moose;
use namespace::autoclean;

BEGIN { extends "Catalyst::Controller" }

sub index :Path :Args(0)
{
    my ($self, $c) = @_;
    $c->response->body("Matched PF2K7::Controller::PF in PF.");
}

sub home :Local :Args(0)
{
    my ($self, $c) = @_;
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 NAME

PF2K7::Controller::PF - PF Controller for PF2K7

=head1 DESCRIPTION

Main PF controller

=head1 METHODS

=head1 AUTHOR

Paul Johnson, paul@pjcj.net

=head1 LICENSE

Copyright 2010, Paul Johnson (paul@pjcj.net).

This software is free.  It is licensed under the same terms as Perl itself.

=cut
