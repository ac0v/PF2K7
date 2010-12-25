package PF2K7;

use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use Catalyst qw(
    ConfigLoader
    Static::Simple

    Authentication
    Authorization::Roles
    Session
    Session::State::Cookie
    Session::Store::FastMmap
);

extends 'Catalyst';

our $VERSION = '0.1.0';

# Start the application
__PACKAGE__->setup();

1;

__END__

=head1 NAME

PF2K7 - Catalyst based application

=head1 SYNOPSIS

    script/pf2k7_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<PF2K7::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Catalyst developer

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

