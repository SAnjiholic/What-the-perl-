#!/usr/bin/perl
use strict;
use warnings;
use Email::Send;
use Email::Send::Gmail;
use Email::Simple::Creator;
use Digest::MD5  qw(md5_hex);
use DBI;

my @rand;
my $flag1 = 0;
my $lop = 2;
my $ret;
my $mailname = shift;


my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime;
	$year = $year+1900; $mon++;

my $today = "$year/$mon/$mday";

	while (1) {
		if($lop){
				$rand[$flag1] = int(rand(1000000));
				$lop--;
				$flag1++;}
		else{last;}}
	$ret = $rand[0].$rand[1];
	my $md5_hash = md5_hex($ret);

&addmd($md5_hash,$mailname,$today);

my $eax = $md5_hash;

my $email = Email::Simple->create(
      header => [
          From    => 'funsys11@gmail.com',
          To      => $mailname,
          Subject => "In/out Code",
      ],
      body => "$today In/Out Code is on the last line.\n Have a nice day\n\n\n$eax",
  );

my $sender = Email::Send->new(
      {   mailer      => 'Gmail',
          mailer_args => [
              username => 'funsys11@gmail.com',
              password => 'funsys@11',
          ]
      }
  )
eval { $sender->send($email) };
die "Error sending email: $@" if $@;

sub addmd{
	my $md = shift;
	my $em = shift;
	my $date = shift;
	
		my $port = '3306';
		my $driver ='mysql';
		my $database ='test1';
		my $ip;
		my ($user,$pw);
		my $dsn ="DBI:$driver:database=$database;host=$ip;port=$port";
		my $dbh = DBI->connect($dsn, $user,$pw) or  die "Got error $DBI::errstr when connecting to $dsn\n";

		my $sth = $dbh->prepare("SELECT NAME FROM MEMBER where EMAIL = \'$em\'");$sth->execute;
		my @row = $sth->fetchrow_array;
		my $name = shift(@row);

		$dbh->do("INSERT INTO IO_CHECK (NAME,DATE,MD5) VALUES (?,?,?)",
				undef,
				$name,$date,$md);
		}

