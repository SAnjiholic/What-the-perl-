#!/usr/bin/perl
use DBI;
use MIME::Lite;
use Digest::MD5 qw(md5_hex);

my $port = '3306';
my $driver = 'mysql';
my $database = 'IO_CHECK';
my $ip='192.168.0.220';
my $user = 'root';
my $pw ='asdd';

my $dsn ="DBI:$driver:database=$database;host=$ip;port=$port";
my $dbn = DBI->connect($dsn,$user,$pw)or die;
	my $port = '3306';
	my $driver = 'mysql';
	my $database = 'IO_CHECK';
	my $ip='192.168.0.220';
	my $user = 'root';
	my $pw ='asdd';
	my $ST='00:00:00';
	my $dsn ="DBI:$driver:database=$database;host=$ip;port=$port";
	my $dbh = DBI->connect($dsn,$user,$pw)or die;
	my $today =&today;	
	my $sth = $dbh->prepare("SELECT INTIME,OUTTIME,NUMBER,DATE FROM IOT");
	$sth->execute;
	
	while(my @row = $sth->fetchrow_array){
	my $IT = shift(@row);
	my $OT = shift(@row);
	my $Num = shift(@row);
	my $DATE= shift(@row);
	
	my @ST;
	my @IT = split /:/,$IT;
	my @OT = split /:/,$OT;
	if($IT[2]>$OT[2]){
		$OT[1]--;
		$OT[2]+=60;
	}
	if($IT[1]>$OT[1]){
		$OT[0]--;
		$OT[1]+=60;
	}
	

	if($OT[0]> -1){
	$ST[0]=$OT[0]-$IT[0];
	$ST[1]=$OT[1]-$IT[1];
	$ST[2]=$OT[2]-$IT[2];
	$ST ="$ST[0]:$ST[1]:$ST[2]";}

	else
	{
		$ST="00:00:00";}


	$dbh->do("UPDATE IOT SET STIME=? where NUMBER=? and DATE=?",
		undef,
		$ST,
		$Num,
		$DATE);

}

sub today{
	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime;
	$year = $year+1900;$mon++;
	if($mon<10){
		$mon="0$mon";
	}
	if ($mday<10){
		$mday="0$mday";
	}
	$tot = "$year-$mon-$mday";
	return $tot;
	}



