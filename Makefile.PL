use strict;
use warnings;
use ExtUtils::MakeMaker;

my $pm = 'lib/Unicode/Properties.pm';

WriteMakefile (
    VERSION_FROM => $pm,
    ABSTRACT_FROM => $pm,
    AUTHOR => 'Ben Bullock <bkb@cpan.org>',
    PREREQ_PM => {
        'Unicode::UCD',
        'Test::More',
    },
);
