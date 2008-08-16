package Unicode::Properties;

use warnings;
use strict;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK= qw/uniprops/;

=encoding utf8

=head1 NAME

Unicode::Properties - find out what properties a character has

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

    use Unicode::Properties 'uniprops';
    my @prop_list = uniprops ('☺'); # Unicode smiley face
    print "@prop_list\n";

prints

    InMiscellaneousSymbols Any Assigned Common

You can then use, for example, \p{InMiscellaneousSymbols} to match
this character in a regular expression.

=head1 EXPORT

Exports a function "uniprops" on request.

=head1 FUNCTIONS

=head2 uniprops

Given a character, returns a list of properties which the character
has.

=cut

my @propnames = qw/
Armenian
Balinese
Bengali
Bopomofo
Braille
Buginese
Buhid
CanadianAboriginal
Cherokee
Coptic
Cuneiform
Cypriot
Cyrillic
Deseret
Devanagari
Ethiopic
Georgian
Glagolitic
Gothic
Greek
Gujarati
Gurmukhi
Han
Hangul
Hanunoo
Hebrew
Hiragana
Inherited
Kannada
Katakana
Kharoshthi
Khmer
Lao
Latin
Limbu
LinearB
Malayalam
Mongolian
Myanmar
NewTaiLue
Nko
Ogham
OldItalic
OldPersian
Oriya
Osmanya
PhagsPa
Phoenician
Runic
Shavian
Sinhala
SylotiNagri
Syriac
Tagalog
Tagbanwa
TaiLe
Tamil
Telugu
Thaana
Thai
Tibetan
Tifinagh
Ugaritic
Yi
InAegeanNumbers
InAlphabeticPresentationForms
InAncientGreekMusicalNotation
InAncientGreekNumbers
InArabic
InArabicPresentationFormsA
InArabicPresentationFormsB
InArabicSupplement
InArmenian
InArrows
InBalinese
InBasicLatin
InBengali
InBlockElements
InBopomofo
InBopomofoExtended
InBoxDrawing
InBraillePatterns
InBuginese
InBuhid
InByzantineMusicalSymbols
InCJKCompatibility
InCJKCompatibilityForms
InCJKCompatibilityIdeographs
InCJKCompatibilityIdeographsSupplement
InCJKRadicalsSupplement
InCJKStrokes
InCJKSymbolsAndPunctuation
InCJKUnifiedIdeographs
InCJKUnifiedIdeographsExtensionA
InCJKUnifiedIdeographsExtensionB
InCherokee
InCombiningDiacriticalMarks
InCombiningDiacriticalMarksSupplement
InCombiningDiacriticalMarksforSymbols
InCombiningHalfMarks
InControlPictures
InCoptic
InCountingRodNumerals
InCuneiform
InCuneiformNumbersAndPunctuation
InCurrencySymbols
InCypriotSyllabary
InCyrillic
InCyrillicSupplement
InDeseret
InDevanagari
InDingbats
InEnclosedAlphanumerics
InEnclosedCJKLettersAndMonths
InEthiopic
InEthiopicExtended
InEthiopicSupplement
InGeneralPunctuation
InGeometricShapes
InGeorgian
InGeorgianSupplement
InGlagolitic
InGothic
InGreekExtended
InGreekAndCoptic
InGujarati
InGurmukhi
InHalfwidthAndFullwidthForms
InHangulCompatibilityJamo
InHangulJamo
InHangulSyllables
InHanunoo
InHebrew
InHighPrivateUseSurrogates
InHighSurrogates
InHiragana
InIPAExtensions
InIdeographicDescriptionCharacters
InKanbun
InKangxiRadicals
InKannada
InKatakana
InKatakanaPhoneticExtensions
InKharoshthi
InKhmer
InKhmerSymbols
InLao
InLatin1Supplement
InLatinExtendedA
InLatinExtendedAdditional
InLatinExtendedB
InLatinExtendedC
InLatinExtendedD
InLetterlikeSymbols
InLimbu
InLinearBIdeograms
InLinearBSyllabary
InLowSurrogates
InMalayalam
InMathematicalAlphanumericSymbols
InMathematicalOperators
InMiscellaneousMathematicalSymbolsA
InMiscellaneousMathematicalSymbolsB
InMiscellaneousSymbols
InMiscellaneousSymbolsAndArrows
InMiscellaneousTechnical
InModifierToneLetters
InMongolian
InMusicalSymbols
InMyanmar
InNKo
InNewTaiLue
InNumberForms
InOgham
InOldItalic
InOldPersian
InOpticalCharacterRecognition
InOriya
InOsmanya
InPhagspa
InPhoenician
InPhoneticExtensions
InPhoneticExtensionsSupplement
InPrivateUseArea
InRunic
InShavian
InSinhala
InSmallFormVariants
InSpacingModifierLetters
InSpecials
InSuperscriptsAndSubscripts
InSupplementalArrowsA
InSupplementalArrowsB
InSupplementalMathematicalOperators
InSupplementalPunctuation
InSupplementaryPrivateUseAreaA
InSupplementaryPrivateUseAreaB
InSylotiNagri
InSyriac
InTagalog
InTagbanwa
InTags
InTaiLe
InTaiXuanJingSymbols
InTamil
InTelugu
InThaana
InThai
InTibetan
InTifinagh
InUgaritic
InUnifiedCanadianAboriginalSyllabics
InVariationSelectors
InVariationSelectorsSupplement
InVerticalForms
InYiRadicals
InYiSyllables
InYijingHexagramSymbols
Alphabetic
Lowercase
Uppercase
Math
IDStart
IDContinue
DefaultIgnorableCodePoint
Any
Assigned
Unassigned
ASCII
Common
/;

sub uniprops {
    my ($inchar) = @_;
    return if !$inchar;
    if (length($inchar) != 1) {
	$inchar = substr ($inchar, 0, 1);
    }
    my @matched;
    for my $block (@propnames) {
	if ($inchar =~ /^\p{$block}$/) {
	    push @matched, $block;
	}
    }
    return wantarray ? @matched : \@matched;
}

=head1 AUTHOR

Ben Kasmin Bullock, C<< <benkasminbullock at gmail.com> >>

=head1 BUG REPORTS

Please report any bugs or feature requests to C<bug-unicode-properties
at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Unicode-Properties>.
I will be notified, and then you'll automatically be notified of
progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Unicode::Properties

=head1 BUGS

=over

=item Data source

This module uses a list taken from the "perlunicode" documentation. It
would be better to use Perl's internals to get the list, but I don't
know how to do that.

=back

=head1 COPYRIGHT & LICENSE

Copyright 2008 Ben Kasmin Bullock, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of Unicode::Properties
