#!/usr/bin/env perl
use strict;
use v5.26;

my $asdcnt = 0;
my $ocnt = 0;
my $count = 1;
my $doo = '/usr/bin/g++ ';
my @argv = @ARGV;

foreach(@argv){
	if(/-asd/){$asdcnt = $count; }
	$ocnt = $count if(/-o/);
	$count++;
	$doo .= $_.' ';
}

if($doo =~ /-asd/){
	if($doo =~ /-o/){
		$doo .= '; ./'.$argv[$ocnt];
	}
	else{
		$doo .='; ./a.out';
	}
}
$doo =~ s/-asd//g;
my $test = `$doo`;
print $test;
