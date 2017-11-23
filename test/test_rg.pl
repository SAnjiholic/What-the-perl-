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
#DB Connect
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
				-font => "Arial 20")   ->pack();#-side=>"top");

$main->geometry("250x55");

$dialog      = $main->DialogBox(-title   => "Register",
                        -buttons=> ["Register", "Cancle"],);
$dialog->add("Label",	-text => "Name",
						-font => "Arial 15")->pack();
$entry  = $dialog ->add("Entry", -width => 35)->pack();




$startbut   = $main->DialogBox(-title  => "Scan your Barcode",
                        -buttons=> ["OK", "Cancle"],);
$startbut->add("Label", -text => "Barcode Scan",
						-font => "Arial 15")->pack();
$entry2 = $startbut ->add("Entry", -width => 35)->pack();



$starting   = $main->DialogBox(-title   => "Start measurement",
                        -buttons=> ["Save","Count"],);
$starting->add("Label", -text => "Start measurement",
						-font => "Arial 20")->pack();





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
			  # print "ID : $row[0] | Name : $row[1] | Cycle : $row[2]\n";
               $done = 1;}
                    
			&rgsmsg;
            $done = 1;
            }
          #  else{
           #    print "you didnt give me your name\n";
            #   }
      }
      else{
       #  print"Sorry you edcided not to register.\n";
         $done = 1;
      }
   }
   until $done;
}


sub rgsmsg{
my $test = "register Success";
my $mw = $main->Toplevel;
$mw->title("register Success!");
$mw->Label( -text => "$test",
			-font => "Arial 20")->pack;
}

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
	prolong => 2.96
   );
 
prEnd();
}
}

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

&register;