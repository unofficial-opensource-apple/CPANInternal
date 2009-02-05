###########################################################################
#
# This file is auto-generated by the Perl DateTime Suite time locale
# generator (0.02).  This code generator comes with the
# DateTime::Locale distribution in the tools/ directory, and is called
# generate_from_icu.
#
# This file as generated from the ICU XML locale data.  See the
# LICENSE.icu file included in this distribution for license details.
#
# This file was generated from the source file es_US.xml.
# The source file version number was 1.2, generated on
# 2004-08-27.
#
# Do not edit this file directly.
#
###########################################################################

package DateTime::Locale::es_US;

use strict;

BEGIN
{
    if ( $] >= 5.006 )
    {
        require utf8; utf8->import;
    }
}

use DateTime::Locale::es;

@DateTime::Locale::es_US::ISA = qw(DateTime::Locale::es);

my $date_parts_order = "mdy";


sub medium_date_format             { "\%b\ \%\{day\}\,\ \%\{ce_year\}" }
sub short_date_format              { "\%\{month\}\/\%\{day\}\/\%y" }
sub full_time_format               { "\%\{hour_12\}\:\%M\:\%S\ \%p\ \%\{time_zone_long_name\}" }
sub long_time_format               { "\%\{hour_12\}\:\%M\:\%S\ \%p\ \%\{time_zone_long_name\}" }
sub medium_time_format             { "\%\{hour_12\}\:\%M\:\%S\ \%p" }
sub short_time_format              { "\%\{hour_12\}\:\%M\ \%p" }
sub date_parts_order               { $date_parts_order }



1;

