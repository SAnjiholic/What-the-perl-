my @now_mod; 
my @inc = &inc;
$aad = 0;
$level = -1; 
@tt = split(/\\/,$ARGV[0]);
@tt = split(/\//,$ARGV[0]) unless $tt[0];

modules_name($ARGV[0],$tt[-1]);

sub modules_name{
	$level++;
	my $name = shift;
	my $name_real = shift;
	$now_mod[$level] = $name_real;
	$now_mod = $name_real;
	open (F,$name);	my @files = <F>; close(F);
	foreach (@files) {
			if(/^use /){
				s/^use | |;|\n|qw.*|\(.*//g;
				my @tmp = split " "; next if ($tmp[3]);	
				unless (/strict/|/warnings/|/vars/|/(5\.)+/|/constant/) {				
				$aad++;
				modules_find($_,$now_mod)
				}			
			elsif(/__END__/){
				if(/^__END__/){last}
				elsif(/(^ )+__END__/){last}
					}
				}
			}
	$level--;
	$now_mod = $now_mod[$level];
}

sub modules_find{ 
	my $mod_name = $_ if ($_);
	my $brk;
	print "$aad : use ";
	print $mod_name if ($_);
	print " \($now_mod => $mod_name) " if ($now_mod);
	print "\n";
	s/::/\//g;	
	$pm_flag = substr $mod_name, -2;
	$mod_name .=".pm" unless ($mod_name eq "pm");		
	foreach (@inc) {
		$where = $_.$mod_name;
		if (-f $where) {
			$brk = 1;
			modules_name($where,$mod_name);
			}
		elsif($brk){$brk = 0; last}
		else {last}
	}
}
sub inc{
	my $flag; 
	my $number; 
	my @lib;
	my @a = `perl -V`;	
	foreach (@a) {
		if ($flag) {
			s/ |\n//g;
			$lib[$number] = $_."/";
			$number++;	 
			}
		$flag = 1 if (/\@INC/)
	}
	return @lib; 
}