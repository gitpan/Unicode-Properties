#!/usr/bin/perl
use warnings;
use strict;
use lib 'lib';
use Unicode::Properties 'uniprops';

print join (',',uniprops('2')),"\n";



