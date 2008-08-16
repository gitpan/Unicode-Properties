#!perl

use Test::More tests => 6;
use utf8;
BEGIN {
	use_ok( 'Unicode::Properties' );
}

use Unicode::Properties 'uniprops';

ok (!defined (uniprops()), 'empty input undefined output');
ok (join (',', uniprops('A')) eq 
    "Latin,InBasicLatin,Alphabetic,Uppercase,IDStart,IDContinue,Any,Assigned,ASCII",
    'ASCII A properties');
ok (join (',', uniprops('AGGRO')) eq 
    "Latin,InBasicLatin,Alphabetic,Uppercase,IDStart,IDContinue,Any,Assigned,ASCII",
    'Truncate long strings');
ok (join (',', uniprops('☺')) eq 
    "InMiscellaneousSymbols,Any,Assigned,Common",
    'Unicode smiley properties');
ok (join (',', uniprops('あ')) eq
	  "Hiragana,InHiragana,Alphabetic,IDStart,IDContinue,Any,Assigned",
	  "Hiragana A properties");
