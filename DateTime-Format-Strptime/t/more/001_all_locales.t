#!perl -w

# t/more/001_all_locales.t - test formatting against every locales

use Test::More qw(no_plan);
use DateTime::Format::Strptime;
use DateTime::Locale;
use DateTime;

my @locales = DateTime::Locale->ids;
@locales = sort(@locales);

diag("\nChecking Day Names");
my $pattern = "%Y-%m-%d %A";
foreach my $locale ( @locales ) {
	foreach my $day (1..7) {
		my $dt = DateTime->now( locale => $locale )->set( day => $day );
		my $input = $dt->strftime($pattern);
		eval { $strptime = DateTime::Format::Strptime->new(
			pattern => $pattern,
			locale  => $locale,
			on_error=> 'croak',
		)};
		ok($@ eq '',"Constructor with Day Name");

		my $parsed;
		eval {
			$parsed = $strptime->parse_datetime($input);
		} unless $@;
		diag("[$@]") if $@ ne '';
		ok($@ eq '',"Parsed with Day Name");

		is($parsed->strftime($pattern),$input,"Matched with Day Name");
	}
	diag( $locale );
}

diag("\nChecking Month Names");
$pattern = "%Y-%m-%d %B";
foreach my $locale ( @locales ) {
	foreach my $month (1..12) {
		my $dt = DateTime->now( locale => $locale )->truncate( to => 'month' )->set( month => $month );
		my $input = $dt->strftime($pattern);
		eval { $strptime = DateTime::Format::Strptime->new(
			pattern => $pattern,
			locale  => $locale,
			on_error=> 'croak',
		)};
		ok($@ eq '',"Constructor with Month Name");

		my $parsed;
		eval {
			$parsed = $strptime->parse_datetime($input);
		} unless $@;
		diag("[$@]") if $@ ne '';
		ok($@ eq '',"Parsed with Month Name");

		is($parsed->strftime($pattern),$input,"Matched with Month Name");
	}
	diag( $locale );
}

diag("\nChecking AM/PM tokens");
$pattern = "%Y-%m-%d %H:%M %p";
foreach my $locale ( @locales ) {
	foreach my $hour (11,12) {
		my $dt = DateTime->now( locale => $locale )->set( hour => $hour );
		my $input = $dt->strftime($pattern);
		eval { $strptime = DateTime::Format::Strptime->new(
			pattern => $pattern,
			locale  => $locale,
			on_error=> 'croak',
		)};
		ok($@ eq '',"Constructor with Meridian");

		my $parsed;
		eval {
			$parsed = $strptime->parse_datetime($input);
		} unless $@;
		diag("[$@]") if $@ ne '';
		ok($@ eq '',"Parsed with Meridian");

		is($parsed->strftime($pattern),$input,"Matched with Meridian");
	}
	diag( $locale );
}

