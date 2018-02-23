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

	my $dsn ="DBI:$driver:database=$database;host=$ip;port=$port";
	my $dbh = DBI->connect($dsn,$user,$pw)or die;
	
	my $sth = $dbh->prepare("SELECT NAME,NUMBER FROM MEMBER");
	$sth->execute;
	
	while(my @row = $sth->fetchrow_array){
	my $name = shift(@row);
	my $num = shift(@row);
	my $date=&today;
	$dbh->do("INSERT INTO IO_CHECK (NAME,NUMBER,DATE) VALUES (?,?,?)",
		undef,
		$name,$num,$date);
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
	my $today = "$year-$mon-$mday";
	return $today;
	}



