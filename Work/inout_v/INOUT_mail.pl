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

my $sth = $dbn->prepare("SELECT EMAIL FROM MEMBER");
$sth->execute;

#my @email = $sth->fetchrow_array;

while(my @email = $sth->fetchrow_array)
	
	{
		$email=shift(@email);
		&sma($email);
	}

sub sma{
my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime;
	$year = $year+1900;$mon++;
	if($mon<10){
		$mon="0$mon";
	}
	if ($mday<10){
		$mday="0$mday";
	}
my $today = "$year-$mon-$mday";


my @rand;
my $flag1 =0;
my $lop = 2;
my $ret;
my $mailname=shift;

while (1){
	if($lop){
		$rand[$flag1] = int(rand(1000000));
		$lop--;
		$flag1++;
	}
	else{last;}}
	
$ret = $rand[0].$rand[1];
my $md5_hash = md5_hex($ret);
&addmd($md5_hash,$mailname,$today);
my $msg = MIME::Lite->new(
	'Return-Path' => 'funsys11@gmail.com',
	'From'	=> 'funsys11@gmail.com',
	'To'	=> "$mailname",
	'Subject'=> 'IN/OUT CHECK CODE',
	'Charset'=> 'utf-8',
	'Encoding' => '8bit',
	'Data' => "$today IN/OUT code is on the last line. \n\n $md5_hash"
);
$msg->send;
}

sub addmd{

	my $md = shift;
	my $em = shift;
	my $date = shift;

			
		my $port = '3306';
		my $driver = 'mysql';
		my $database = 'IO_CHECK';
		my $ip='192.168.0.220';
		my $user = 'root';
		my $pw ='asdd';

		my $dsn ="DBI:$driver:database=$database;host=$ip;port=$port";
		my $dbh = DBI->connect($dsn,$user,$pw)or die;
		
		my $sth = $dbh->prepare("SELECT NAME,NUMBER FROM MEMBER where EMAIL = \'$em\'");
		$sth->execute;
		my @row = $sth->fetchrow_array;
		my $name = shift(@row);
		my $num = shift(@row);

		$dbh->do("INSERT INTO IO_CHECK (NAME,NUMBER,DATE,MD5) VALUES (?,?,?,?)",
			undef,
			$name,$num,$date,$md);

			
}
