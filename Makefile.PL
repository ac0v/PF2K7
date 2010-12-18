#!/usr/bin/perl

use strict;
use warnings;

require 5.012_002;

# use inc::Module::Install;
# use Module::Install::Catalyst;

# name 'PF2K7';
# all_from 'lib/PF2K7.pm';

# requires 'Catalyst::Runtime' => '5.80028';
# requires 'Catalyst::Plugin::ConfigLoader';
# requires 'Catalyst::Plugin::Static::Simple';
# requires 'Catalyst::Action::RenderView';
# requires 'Catalyst::Engine::PSGI';
# requires 'Moose';
# requires 'namespace::autoclean';
# requires 'Config::General';

# test_requires 'Test::More' => '0.88';
# catalyst;

# install_script glob('script/*.pl');
# auto_install;
# WriteAll;

# __END__

use ExtUtils::MakeMaker;
use ExtUtils::Manifest "maniread";

my $Version  = "1.01";
my $Email    = 'uea-pf2k7@pjcj.net';
my $Dist     = "PF2K7";
my $Top      = "lib/PF2K7.pm";
my @Files    = sort keys %{maniread()};
my $Perlbug  = join " ", map { / / ? "'$_'" : $_ }
                             "perlbug", "-a", $Email,
                                        "-s", "Installation of $Dist $Version";
my $Readcmd = <<"EOC";
TERMCAP= COLUMNS=80 pod2text -s $Top | \\
    \$(PERL) -n \\
    -e 'print if (/NAME/         ... /^[A-Z ]+\$\$/) =~ /^\\d+\$\$/;' \\
    -e 'print if (/SYNOPSIS/     ... /^[A-Z ]+\$\$/) =~ /^\\d+\$\$/;' \\
    -e 'print if (/DESCRIPTION/  ... /^[A-Z ]+\$\$/) =~ /^\\d+\$\$/;' \\
    -e 'print if (/REQUIREMENTS/ ... /^[A-Z ]+\$\$/) =~ /^\\d+\$\$/;' \\
    > \$(DISTVNAME)/README
EOC

WriteMakefile
(
    NAME     => $Dist,
    VERSION  => $Version,
    AUTHOR   => "PEM ($Email)",
    ABSTRACT => "PF2K7 - Plat_Forms 2007",
    DIR      => [],
    dist     => { COMPRESS => "gzip --best --force",
                  PREOP    => $Readcmd            },
    clean    => { FILES    => "t/TEST"            },
    depend   => { distdir  => "@Files"            },
    test     => { TESTS    => "t/*/*.t"           },
);

sub MY::libscan { $_[1] =~/^blib/ && $_[1] !~ /\.pm$/ ? undef : $_ }

sub MY::postamble
{
    qq[
tags : @Files
\t ptags @Files

mani :
\t rm MANIFEST; \$(MAKE) manifest

dev_server : pure_all
\t \$(PERL) script/pf2k7_server.pl -d -f

start_server :
\t \$(PERL) utils/makeh start_server

stop_server :
\t \$(PERL) utils/makeh stop_server

show_servers :
\t \$(PERL) utils/makeh show_servers

restart_server :
\t \$(PERL) utils/makeh restart_server

export HARNESS_OPTIONS := j4:c
export HARNESS_TIMER   := 1
export TEST_POD        := 0

tv :
\t \$(MAKE) test TEST_VERBOSE=1 HARNESS_OPTIONS=j1:c CATALYST_DEBUG=1

td :
\t \$(MAKE) test PF_DB_TEST=1

tvd :
\t \$(MAKE) test TEST_VERBOSE=1 PF_DB_TEST=1 HARNESS_OPTIONS=j1:c CATALYST_DEBUG=1

stest :: pure_all restart_server
\t CATALYST_SERVER=http://127.0.0.1:\$(shell cat utils/PORT)/ PERL_DL_NONLAZY=1 \$(FULLPERLRUN) "-MExtUtils::Command::MM" "-e" "test_harness(\$(TEST_VERBOSE), '\$(INST_LIB)', '\$(INST_ARCHLIB)')" \$(TEST_FILES)

cover : pure_all
\t PF_COVER=1 HARNESS_OPTIONS=j4:c cover -test -report html_basic

ok :
\t \@$Perlbug -okay  || echo "Please send your report manually to $Email"

nok :
\t \@$Perlbug -nokay || echo "Please send your report manually to $Email"
    ]
}

__END__

=head1 NAME

Makefile.PL - Create Makefile for PF

=head1 SYNOPSIS

 perl Makefile.PL

=head1 DESCRIPTION

Creates the Makefile for PF.

=head1 EXIT STATUS

The following exit values are returned:

0   All operations were completed successfully.

>0  An error occurred.

=head1 SEE ALSO

=head1 BUGS

=head1 VERSION

See $Version

=head1 AUTHOR

Paul Johnson

=head1 LICENSE

Copyright 2010, Paul Johnson (paul@pjcj.net)

# This software is free.  It is licensed under the same terms as Perl itself.

=cut
