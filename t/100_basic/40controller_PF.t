#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

use Catalyst::Test "PF2K7";
use PF2K7::Controller::PF;

ok(request("/pf")->is_success, "Request should succeed");

done_testing();
