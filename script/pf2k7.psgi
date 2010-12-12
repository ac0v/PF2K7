#!/usr/bin/env perl
use strict;
use warnings;

use blib;

use PF2K7;

PF2K7->setup_engine('PSGI');
my $app = sub { PF2K7->run(@_) };
