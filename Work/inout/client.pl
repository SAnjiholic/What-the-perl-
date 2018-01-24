#!/usr/bin/perl
use DBI;

my $md5 = shift;
unless($md5){
	$md5 =<>;
}

my @time = localtime;
my $port = '3306';
my $driver = 'mysql';
my $database = 'test1';
my $ip,$user,$pw;

my $dsn = "DBI:$driver:database=$database;host=$ip;port=$port";
my $dbn = DBI->connect($dsn,$user,$pw)or print "Can't Connect";

my $sth = $dbn->prepare("Select IN FROM IO_CHECK where MD5=$md5");
my @row = $sth->fetchrow_array;
my $flag = shift(@row);

unless($flag){
	my
}
