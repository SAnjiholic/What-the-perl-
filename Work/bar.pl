#!/usr/bin/perl

use DBI;

my $pnum = shift;
my $petc;
my $zpl;

my $hostname = 'YJDBIP';
my $port = '3306';
my $driver ='mssql';
my $database ='springwd1718_fun2';
my $user = 'springwd1718_fun2';
my $password = 'funsys@11';


 
my $dsn ="DBI:ODBC:Driver=$driver;database=$database;host=$hostname;port=$port";
my $dbh = DBI->connect($dsn, $user,$password);
my $sql = "select etc from T_PRODUCT where PROD_NUM = $pnum";
my $sth = $dbh->prepare($sql); $sth->execute;
my @row = $sth->fetchrow_array;

$petc = shift(@row);


$zpl ="\^XA\n";
$zpl = $zpl."\^FO 50,30\^BQN,2,6\^FD,,$pnum\^FS\n";
$zpl = $zpl."\^FO 60,180\^AD,25,8\^FD$pnum\^FS\n";
$zpl = $zpl."\^FO 220,40\^ADB,30,12\^FD$todat\^FS\n";
$zpl = $zpl."\^FO 260,38\^ADB,30,12\^FD$nowt\^FS\n";
$zpl = $zpl."\^FO 220,160\^A0,28,40\^FD$petc\^FS\n";
$zpl = $zpl."\^XZ\n";


print $zpl;

