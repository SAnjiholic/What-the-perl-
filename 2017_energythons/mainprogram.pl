use DBI;
use Tk;
use Tk::DialogBox;
use Tk::MsgBox;
use Cwd;
use PDF::Reuse;
use PDF::Reuse::Barcode;
use Barcode::Code128;
use Win32;
use Win32::GuiTest qw/:ALL/;
use Config;
use threads;
use threads::shared;

my $logpwd = getcwd."/log.txt";


#----------------------------------------------------------------------------------------------
my $location=tkinit;
$location->withdraw;
$height = $location->screenheight;
$width = $location->screenwidth;
$height1 = $height/2+25;
$width1 = ($width/2+50);
$height2 = $height/2+50;
$width2 = $width/2+60;
#------------------------------------------------------------------------------------------------
my $dbfile = "test.db";
my $dsn      = "dbi:SQLite:dbname=$dbfile";
my $user     = "";
my $password = "";

my $dbh = DBI->connect($dsn, $user, $password, {
   PrintError       => 0,
   RaiseError       => 1,
   AutoCommit       => 1,
   FetchHashKeyName => 'NAME_lc',
});

$pwd = getcwd."/test.db";

if(-f $pwd){ 
   unless(-s $pwd){

my $sql = <<'END_SQL';
 CREATE TABLE test (
 id INTEGER PRIMARY KEY,
 name VARCHAR(100),
 cycle int default 0);
END_SQL
 $dbh->do($sql);
my $name = 'root';
my $id = 1000000;
 $dbh->do('INSERT INTO test (id,name) VALUES (?,?)',
 undef,
 $id,$name);

}}

#----------------------------------------------------------------------------------------------

$main = MainWindow->new();

$main->Button(	-text   =>"Registration",
		-command=>\&register,
		-width=>15,
		#-height=>5
		-font => "Arial 20")->pack();#-side=>"top");
$main->Button(	-text   =>"start",
		-command=>\&start,
		-width=>15,
		#-height=>5,
		-font => "Arial 20") ->pack();#-side=>"left");
$main->Button(  -text   =>"Quit",
		-command=>sub{exit},
		-width=>15,
		#-height=>'5'
		-font => "Arial 20")->pack(-side=>"bottom");
$main->geometry("250x150");
$main->bind('<Return>', \&start); 
#----------------------------------------------------------------------------------------------
$dialog = $main->DialogBox(-title   => "Register",-buttons=> ["Register", "Cancle"],);
$dialog->add("Label",	-text => "Name",
			-font => "Arial 15")->pack();
$entry = $dialog ->add("Entry", -width => 35)->pack();
#----------------------------------------------------------------------------------------------
$startbut = $main->DialogBox(-title  => "Scan your Barcode",-buttons=> ["OK", "Cancle"],);
$startbut->add("Label", -text => "Barcode Scan"	,
			-font => "Arial 15")->pack();
$entry2 = $startbut ->add("Entry", -width => 35)->pack();
$entry2->{'default_button'};
#$entry2 = $startbut ->add("focus", default_button=>$entry2)->pack();

#----------------------------------------------------------------------------------------------

$starting   = $main->DialogBox(-title   => "Start measurement", -buttons=> ["Save","Count"],);
$starting->add("Label", -text => "Start measurement",-font => "Arial 20")->pack();
#$entry3  = $starting ->add("Entry", -width => 35)->pack();
        
MainLoop;
#----------------------------------------------------------------------------------------------

sub register{
   my $button;
   my $done = 0;
   do{
      $button = $dialog->Show;
      if ($button eq "Register"){
         my $name = $entry->get;
         if (defined($name) && length($name)){
            $dbh->do('INSERT INTO test (name) VALUES (?)',undef,$name);
            my $newname="\'".$name."\'"; 
	    my $sth = $dbh->prepare("SELECT * FROM test WHERE name = $newname");
               $sth->execute;
         
        while (	my @row = $sth->fetchrow_array ) {
		&madelog;
		&barcode($row[0],$row[1]);
		open FH, ">>", "$logpwd" or die "$!\n";
		print FH &now;
		print FH "$row[0]th users joined. \n";
		close FH;
		 # print "ID : $row[0] | Name : $row[1] | Cycle : $row[2]\n";
               	$done = 1;
	} 
	&rgsmsg;
        $done = 1;
	}
          #  else{
           # print "you didnt give me your name\n";
            #   }
      }
      else{ #print"Sorry you edcided not to register.\n";
            $done = 1;
      }
   }
   until $done;
}

#----------------------------------------------------------------------------------------------
sub start{
	my $t1=threads->new(\&sub1,1);
	$1=>death;
	$entry2->delete('0', 'end');
	my $button;
	my $done = 0;
  
  do{
	$button = $startbut->Show;
	if( $button eq "OK"){	  
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
				}}}	
		else{$done = 1;}}
	until $done;
}


#----------------------------------------------------------------------------------------------


sub starting{
   my $button;
   my $done = 0;
   my $oldcycle=$_[2];
   my $newcycle=$oldcycle;
   my $count=0;
   my $onecount=1;
   MouseMoveAbsPix($width2, $height2);  
   do{     
	   while(1){
		$button = $starting->Show;
    		 if ($button eq "Save"){
		  unless($name){$name=$_[0]}
		  else{my $name = $entry->get;}
			   
			   open FH, ">>", "$logpwd" or die "$!\n";
			   print FH &now;
			   print FH "$_[0]-$_[1] saved. add cycle:$count total cycle : $newcycle\n";
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
		  &okmsg($_[1],$count,$newcycle);
		  }}

#----------------------------------------------------------------------------------------------

sub rgsmsg{
my $test = "register Success";
my $mw = $main->Toplevel;
$mw->title("register Success!");
$mw->Label( -text => "$test",
			-font => "Arial 20")->pack;
$mw->after(500, sub {$mw->destroy});

#$mw->Button(-text => "OK")->pack(); 
        # -command=>sub{exit})  ->pack()
}
#----------------------------------------------------------------------------------------------

sub okmsg{
my $test = "Save Success\n".$_[0]." add cycle ".$_[1]."\nTotal Count : ".$_[2];
my $mw = $main->Toplevel;
$mw->title("Save Success!");
$mw->Label( -text => "$test",
			-font => "Arial 15")->pack;
#$mw->bind('<Return>', \&start); 
$mw->after(2000, sub {$mw->destroy});
}


#----------------------------------------------------------------------------------------------

sub barcode{
   my $pwd = getcwd.$_[0].$_[1]."pdf";
   unless(-f $pwd){
   my $pdfname = $_[0]."-".$_[1].".pdf";
   prFile($pdfname);
 
my $code = $_[0];

PDF::Reuse::Barcode::Code128(
	x => 0,
	y => 300,
	size=>5.0,
    	value => $code,
	prolong => 2.96);
prEnd();}}
#----------------------------------------------------------------------------------------------

sub madelog{
my $logpwd = getcwd."/log.txt";
unless(-f $logpwd) {
	system("type NUL > $logpwd");}
	}
#----------------------------------------------------------------------------------------------

sub now{
my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime;
$year = $year+1900;
$now = $year."/".$mon."/".$mday." ".$hour.":".$min.":".$sec." ";
}


#----------------------------------------------------------------------------------------------

sub sub1{
	#Its Waring
		MouseMoveAbsPix($width1, $height1);
		SendMouse('{LEFTCLICK}{LEFTCLICK}');
		exit;
}
