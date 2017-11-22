sub start{
   my $button;
   my $done = 0;
   do{
      $button = $startbut->Show;

		if($button eq "OK"){
		 
         my $id = $entry2->get;
		 if($id){
			if($id){
               my $idnum = $id;
               my $sth = $dbh->prepare("SELECT * FROM test where  id = $idnum");
               $sth->execute;
               while ( my @row = $sth->fetchrow_array ) {
	
			   open FH, ">>", "$logpwd" or die "$!\n";
			   print FH &now;
			   print FH "$row[0]-$row[1] login. cycle:$row[2] \n";
			   close FH;
			   $done = 1;
            &starting($row[0],$row[1],$row[2]);
            }
            
            }
         


           
      }}
 }
   
   until $done;
   }