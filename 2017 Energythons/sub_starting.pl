
sub starting{
   my $button;
   my $done = 0;
   my $oldcycle=$_[2];
   my $newcycle=$oldcycle;
   my $count=0;
   my $onecount=1;
   
   do{     
	   while(1){
		$button = $starting->Show;
    
	  if   ($button eq "Save"){
		  
		  unless($name){$name=$_[0]}
		  else{my $name = $entry->get;}
			   
			   open FH, ">>", "$logpwd" or die "$!\n";
			   print FH &now;
			   print FH "$_[0]-$_[1] saved. add cycle:$count \n";
			   close FH;
		 		
		last;
		  }
      
	  elsif ($button eq "Count") {
		  $newcycle++;
		  $count++;
		  $dbh->do('UPDATE test SET cycle = ? WHERE id = ?',
			undef,
			$newcycle,
			$_[0]
			);

	
		  
		
		  }}
		  &okmsg($_[1],$count);
		  }}
