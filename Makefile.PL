use strict;
use warnings;
use ExtUtils::MakeMaker;

my $pm = 'lib/Unicode/Properties.pm';

WriteMakefile (
    NAME => 'Unicode::Properties',
    VERSION_FROM => $pm,
    ABSTRACT_FROM => $pm,
    AUTHOR => 'Ben Bullock <bkb@cpan.org>',
    PREREQ_PM => {
        'Unicode::UCD' => 0,
        'Test::More' => 0,
    },
);
