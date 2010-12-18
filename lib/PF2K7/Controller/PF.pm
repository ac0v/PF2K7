package PF2K7::Controller::PF;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

PF2K7::Controller::PF - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0)
{
    my ($self, $c) = @_;
    $c->response->body('Matched PF2K7::Controller::PF in PF.');
}

sub home :Local :Args(0)
{
    my ($self, $c) = @_;
}


=head1 AUTHOR

Paul Johnson,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
