package PF2K7::View::TT;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt2',
    render_die => 1,
);

=head1 NAME

PF2K7::View::TT - TT View for PF2K7

=head1 DESCRIPTION

TT View for PF2K7.

=head1 SEE ALSO

L<PF2K7>

=head1 AUTHOR

Paul Johnson,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
