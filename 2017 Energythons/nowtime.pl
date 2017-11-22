
sub now{
my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime;
$year = $year+1900;
$now = $year."/".$mon."/".$mday." ".$hour.":".$min.":".$sec." ";
}