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
# This file was generated from the source file zh_Hant.xml.
# The source file version number was 1.2, generated on
# 2004-08-27.
#
# Do not edit this file directly.
#
###########################################################################

package DateTime::Locale::zh_Hant;

use strict;

BEGIN
{
    if ( $] >= 5.006 )
    {
        require utf8; utf8->import;
    }
}

use DateTime::Locale::zh;

@DateTime::Locale::zh_Hant::ISA = qw(DateTime::Locale::zh);

my $date_parts_order = "ymd";


sub full_date_format               { "\%\{ce_year\}年\%\{month\}月\%\{day\}日\%A" }
sub long_date_format               { "\%\{ce_year\}年\%\{month\}月\%\{day\}日" }
sub medium_date_format             { "\%\{ce_year\}\/\%\{month\}\/\%\{day\}" }
sub short_date_format              { "\%\{ce_year\}\/\%\{month\}\/\%\{day\}" }
sub full_time_format               { "\%p\%l時\%M分\%S秒\ \%\{time_zone_long_name\}" }
sub long_time_format               { "\%p\%l時\%M分\%S秒" }
sub medium_time_format             { "\%p\ \%\{hour_12\}\:\%M\:\%S" }
sub short_time_format              { "\%p\ \%\{hour_12\}\:\%M" }
sub date_parts_order               { $date_parts_order }



1;

