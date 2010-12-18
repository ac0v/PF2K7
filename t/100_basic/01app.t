#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'PF2K7' }

ok( request('/')->is_success, 'Request should succeed' );

done_testing();
