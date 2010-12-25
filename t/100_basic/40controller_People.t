#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

use Catalyst::Test 'PF2K7';
use PF2K7::Controller::People;

ok(request('/people/login')->is_success(), 'Request should succeed');
ok(request('/people/register')->is_success(), 'Request should succeed');

done_testing();
