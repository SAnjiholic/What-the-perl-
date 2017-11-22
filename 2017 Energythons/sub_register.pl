sub register{
   my $button;
   my $done = 0;
   do{
      $button = $dialog->Show;

      if   ($button eq "Register"){
         my $name = $entry->get;

         if   (defined($name)   &&   length($name)){
                                     
            $dbh->do('INSERT INTO test (name) VALUES (?)',
            undef,
            $name);

            my $newname="\'".$name."\'"; 
          my $sth = $dbh->prepare("SELECT * FROM test WHERE name = $newname");
               $sth->execute;
         
               while ( my @row = $sth->fetchrow_array ) {
				   &madelog;
               &barcode($row[0],$row[1]);
               open FH, ">>", "$logpwd" or die "$!\n";
			   print FH &now;
			   print FH "$row[0]th users joined. \n";
			   close FH;
			   $done = 1;}
                    
			&rgsmsg;
            $done = 1;
            }
          
      }
      else{
        $done = 1;
      }
   }
   until $done;
}