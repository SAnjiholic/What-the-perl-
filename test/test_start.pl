use DBI;
use Tk;
use Tk::DialogBox;
use Tk::MsgBox;
use Cwd;
use PDF::Reuse;
use PDF::Reuse::Barcode;
use Barcode::Code128;
use Win32;
use Config;
use threads;
use threads::shared;

my $logpwd = getcwd."/log.txt";
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

sub start{
   my $button;
   my $done = 0;
   do{
      $button = $main->Show;

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
			else{$done = 1;}
		
		
 }
   
   until $done;
   }
  
sub main{
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


$main = MainWindow->new();
$main->title("Scan your Barcode");
$main->Button(	-text   =>"OK",
				-command=>\&main,
				-width=>5,
				#-height=>5
				-font => "Arial 10")   ->pack(	-side=>"left");
$main->Button(	-text   =>"Cancle",
				-command=>\&start,
				-width=>5,
				#-height=>5,
				-font => "Arial 10") ->pack(	-side=>"right");								
$main->Label(	-text => "Start measurement",
						-font => "Arial 20")->pack();
$main->geometry("350x100");
$main ->Entry( -width => 35,)->pack();

$dialog      = $main->DialogBox(-title   => "Register",
                        -buttons=> ["Register", "Cancle"],);
$dialog->add("Label",	-text => "Name",
						-font => "Arial 15")->pack();
$entry  = $dialog ->add("Entry", -width => 35)->pack();




$startbut   = $main->DialogBox(-title  => "Scan your Barcode",
                        -buttons=> ["OK", "Cancle"],);
$startbut->add("Label", -text => "Barcode Scan"	,
						-font => "Arial 15")->pack();
$entry2 = $startbut ->add("Entry", -width => 35)->pack();



$starting   = $main->DialogBox(-title   => "Start measurement",
                        -buttons=> ["Save","Count"],);
$starting->add("Label", -text => "Start measurement",
						-font => "Arial 20")->pack();

sub okmsg{
my $test = "Save Success\n".$_[0]." add cycle ".$_[1]."\nTotal Count : ".$_[2];
my $mw = $main->Toplevel;
$mw->title("Save Success!");
$mw->Label( -text => "$test",
			-font => "Arial 15")->pack;}

sub madelog{
my $logpwd = getcwd."/log.txt";
unless(-f $logpwd) {
	system("type NUL > $logpwd");}
	}

sub now{
my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime;
$year = $year+1900;
$now = $year."/".$mon."/".$mday." ".$hour.":".$min.":".$sec." ";
}

MainLoop;