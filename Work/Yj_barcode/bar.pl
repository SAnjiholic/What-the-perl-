#!/usr/bin/perl

use DBI;
use Cwd;

#my $myp = "1.txt";
my $myp = getcwd."/1.txt";
my $bat = getcwd."/dop.bat";
#my $pnum = '2019664X';
my $pnum = shift;
my $mc = shift;
my $loop = shift;
my $printer = 'ZDesignerGT800';
my $petc;
my $zpl;
my $calcdate;
my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst);

my ($dbusername,$dbpassword,$server,$database);
$dbusername = 'springwd1718_fun2';
$dbpassword = 'funsys@11';
$server     = '211.110.139.11';
$database   = 'springwd1718_fun2';


&now;
$calcdate = &calca($year,$mon,$mday);
$todat = "$mon/$mday/$year";
$nowt = "$hour:$min:$sec";

$dbh = DBI->connect("DBI:ODBC:driver={SQL Server};Server=$server;Database=$database;UID=$dbusername;PWD=$dbpassword") ||  die "$Error_Message $DBI::errstr";

my $sql = "select etc from T_PRODUCT where PROD_NUM = \'$pnum\'";
my $sth=$dbh->prepare($sql);
$sth->execute;
my @row = $sth->fetchrow_array;

$petc = shift(@row);


$zpl ="\^XA\n";
$zpl = $zpl."\^FO 250,15\^BQN,2,6\^FD,,Z20001".$calcdate.$pnum."2026$year\^FS\n";
$zpl = $zpl."\^FO 270,180\^AD,25,13\^FD$pnum\^FS\n";
$zpl = $zpl."\^FO 450,40\^ADB,30,12\^FD$todat\^FS\n";
$zpl = $zpl."\^FO 500,38\^ADB,30,12\^FD$nowt\^FS\n";
$zpl = $zpl."\^FO 450,160\^A0,28,40\^FD$petc\^FS\n";
$zpl = $zpl."\^XZ\n";

	open FH, ">", "$myp" or die "$!\n";
	print FH "$zpl";
	close FH;
	$batcode = 'copy 1.txt \\\127.0.0.1\ZDesignerGT800'.$mc;
	open FH, ">", "$bat" or die "$!\n";
	print FH "$batcode";
	close FH;
	while($loop){
	system("dop.bat");
	$loop--;
	}
	system("del dop.bat");
	system("del 1.txt");

sub calca{
	my $a = shift;
	my $b = shift; $b--;
	my $c = shift;
	my @d = qw/31 28 31 30 31 30 31 31 30 31 30 31/;
	my $msum=0;
	my $R1=0;
	my $R2;
		if ($a%4) {
			my $flag = 0;
			while (1) {
				if ($b) {
					$msum =$msum+$d[$flag];
					$b--;$flag++;
				}
				else{last;}}}
		else{
			$c++;
			my $flag = 0;
			while (1) {
				if ($b) {
					$msum = $msum+$d[$flag];
					$b--;$flag++;
				}
				else{last;}}}

		$msum=$msum+$c;
		$R1 = int($msum/36);
		$R2 = $msum-(36*$R1);
	if ($R1>9) {
		$R1=$R1+55;
		$R1 = chr($R1);
		}
	if($R2>9){
		$R2=$R2+55;
		$R2=chr($R2);
	}
	$sum = $R1.$R2;
	return $sum;
	}



sub now{
($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime;
$year = $year+1900;
$mon++;
$now = $year."/".$mon."/".$mday." ".$hour.":".$min.":".$sec." ";
}