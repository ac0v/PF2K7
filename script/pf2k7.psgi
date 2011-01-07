#!/usr/bin/env perl

use strict;
use warnings;

use Plack::Builder;

# eval required for plackup compatibility
eval 'use blib;';

use PF2K7;

PF2K7->setup_engine("PSGI");

my $app = sub { PF2K7->run(@_) };

builder
{
    enable "Debug",
           panels => [qw( DBITrace Memory Timer Environment Response Parameters
                          CatalystLog )];
    $app
}
