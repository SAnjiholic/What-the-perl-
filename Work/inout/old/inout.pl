use strict;
use warnings;
use Wx qw[:allclasses];
use DBI;
use Cwd;



package main;

my $logpwd = getcwd."/log.txt";
my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst,$time,$now);
my $dbfile	= "INOUT.db";
my $dsn		= "dbi:SQLite:dbname=$dbfile";
my $dbh		= DBI->connect($dsn);
my $pwd		= getcwd."/$dbfile";


if(-f $pwd){ 
   unless(-s $pwd){

my $sql = <<'END_SQL';
	CREATE TABLE resi (
	name VARCHAR(100),
	num INTEGER PRIMARY KEY);
END_SQL
$dbh->do($sql);


$sql = <<'END_SQL';
CREATE TABLE `Comprehensive` (
	`NAME`	VARCHAR(20),
	`NUMBER`INTEEGR,
	`DATE`	VARCHAR(20),
	`IN`	VARCHAR(20),
	`OUT`	VARCHAR(20),
	`TIME`	VARCHAR(20)
);

END_SQL
$dbh->do($sql);

my $dfnum = 10000;
my $dfname= 'root';
$dbh->do('insert into resi (name,num) values(?,?)',undef,$dfname,$dfnum);
   }}
unless(-f $logpwd) {
	system("type NUL > $logpwd");
	}
$dbh->disconnect;


unless(caller){
    my $app = MyApp->new();
    $app->MainLoop();
}


package MyDialog;
use Wx qw[:everything];
use base qw(Wx::Dialog);
use strict;
use Cwd;

my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst,$time,$now);

sub new {
    my( $self, $parent, $id, $title, $pos, $size, $style, $name ) = @_;
    $parent = undef              unless defined $parent;
    $id     = -1                 unless defined $id;
    $title  = ""                 unless defined $title;
    $pos    = wxDefaultPosition  unless defined $pos;
    $size   = wxDefaultSize      unless defined $size;
    $name   = ""                 unless defined $name;

    # begin wxGlade: MyDialog::new
    $style = wxDEFAULT_DIALOG_STYLE
        unless defined $style;

my $BTN1=1;
my $BTN2=2;

   $self = $self->SUPER::new( $parent, $id, $title, $pos, $size, $style, $name );
   $self->{button_1} = Wx::Button->new($self, 1, "\N{U+ac00}\N{U+c785}", wxDefaultPosition, wxDefaultSize, wxBU_AUTODRAW);
   $self->{button_2} = Wx::Button->new($self, $BTN2, "\N{U+c2e4}\N{U+d589}");
   $self->__set_properties();
   $self->__do_layout();

Wx::Event::EVT_BUTTON($self,1,\&residia);
Wx::Event::EVT_BUTTON($self,2,\&inoutdia);
    return $self;
}
sub residia{

    my $app = MyApp2->new();
    $app->MainLoop();
}

sub inoutdia{

    my $app = MyApp3->new();
    $app->MainLoop();
}


sub __set_properties {
    my $self = shift;
    # begin wxGlade: MyDialog::__set_properties
    $self->SetTitle("##### Made SAnji #####");
    $self->SetSize(Wx::Size->new(300, 200));
    $self->{button_1}->SetMinSize(Wx::Size->new(250, 30));
    $self->{button_2}->SetMinSize(Wx::Size->new(250, 30));
    # end wxGlade
}

sub __do_layout {
    my $self = shift;
	my $picnam = '2.png';
	my $picdir = getcwd."/$picnam";
    # begin wxGlade: MyDialog::__do_layout
    $self->{sizer_1} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{sizer_1}->Add($self->{button_1}, 0, wxALIGN_CENTER|wxALL, 3);
    $self->{sizer_1}->Add($self->{button_2}, 0, wxALIGN_CENTER|wxALL, 3);
    my $bitmap_1 = Wx::StaticBitmap->new($self, wxID_ANY, Wx::Bitmap->new("$picdir", wxBITMAP_TYPE_ANY));
    $self->{sizer_1}->Add($bitmap_1, 0, wxALIGN_CENTER|wxALL, 3);
    $self->SetSizer($self->{sizer_1});
    $self->Layout();
    # end wxGlade
}
1;

package MyDialog1;

use Wx qw[:everything];
use base qw(Wx::Dialog);
use strict;
use DBI;
use Cwd;
use Encode;

my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst,$time,$now);



sub new {
    my( $self, $parent, $id, $title, $pos, $size, $style, $name ) = @_;
    $parent = undef              unless defined $parent;
    $id     = -1                 unless defined $id;
    $title  = ""                 unless defined $title;
    $pos    = wxDefaultPosition  unless defined $pos;
    $size   = wxDefaultSize      unless defined $size;
    $name   = ""                 unless defined $name;

	$style = wxDEFAULT_DIALOG_STYLE
	    unless defined $style;
    
	$self = $self->SUPER::new( $parent, $id, $title, $pos, $size, $style, $name );
    $self->{text_ctrl_1} = Wx::TextCtrl->new($self, 7,wxTE_PROCESS_ENTER,);
	$self->{text_ctrl_1}->Clear();
    $self->{button_3} = Wx::Button->new($self, 3, "Register",wxDefaultPosition, wxDefaultSize, wxBU_AUTODRAW);
    $self->{button_4} = Wx::Button->new($self, 4, "Quit");

    $self->__set_properties();
    $self->__do_layout();


Wx::Event::EVT_TEXT_ENTER($self,7,\&resdo);
Wx::Event::EVT_BUTTON($self,3,\&resdo);
Wx::Event::EVT_BUTTON($self,4,\&quitt);
	
    return $self;

}


sub quitt{
	system(exit(0));
}


sub resdo{
	my $self=shift;
	my $name =$self->{text_ctrl_1}->GetValue();


#	print $name."\n";
	$self->{text_ctrl_1}->Clear(); 
	&regis($name)
}


sub regis{

	my $dbfile	= "INOUT.db";
	my $dsn		= "dbi:SQLite:dbname=$dbfile";
	my $dbh		= DBI->connect($dsn);

	&now;
	my $name=shift;
	
		my $sth = $dbh->prepare('SELECT num FROM resi order by num desc');
		$sth->execute;
		my @row = $sth->fetchrow_array;
		my $num = shift(@row);
		print "$num\n";
		$num++;
		$dbh->do('INSERT INTO resi (name,num) VALUES (?,?)',undef,$name,$num);
		$dbh->disconnect;
	&newt($name,$num);
	}


sub newt{
	my $name =shift;
	my $num  =shift;
	
	my $dbfile	= "INOUT.db";
	my $dsn		= "dbi:SQLite:dbname=$dbfile";
	my $dbh		= DBI->connect($dsn);
	
	my $sql = "CREATE TABLE \'$num\' (name VARCHAR(100),num INTEEGR default $num, year INTERGR,month INTERGR default 0,day INTERGR default 0,time varchar(10), flag VARCHAR(10))";
	$dbh->do($sql);
	my $flag = decode("cp949",'가입');
	$dbh->do("INSERT INTO \'$num\' (name,year,flag) VALUES (?,?,?)",
			undef,
			$name,$year,$flag);
	
	   open FH, ">>", "$logpwd" or die "$!\n";
	   print FH &now;
	   print FH "$name join.\n";
	   close FH;
	   $dbh->disconnect;
}


sub now{
	($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime;
	$year = $year+1900; $mon++;
	if ($hour<10) {	$hour="0$hour";}
	if ($min<10) {	$min="0$min";}
	$time = "$hour:$min:$sec";											#출퇴근 시간용
	$now = $year."/".$mon."/".$mday." ".$hour.":".$min.":".$sec." ";	#로그용
	}

sub __set_properties {
    my $self = shift;
    # begin wxGlade: MyDialog1::__set_properties
    $self->SetTitle("##### Made SAnji #####");
    $self->SetSize(Wx::Size->new(200, 120));
    $self->{text_ctrl_1}->SetMinSize(Wx::Size->new(150, 23));
    $self->{button_3}->SetMinSize(Wx::Size->new(86, 26));
    $self->{button_4}->SetMinSize(Wx::Size->new(86, 26));
    # end wxGlade
}

sub __do_layout {
    my $self = shift;
    # begin wxGlade: MyDialog1::__do_layout
    $self->{sizer_2} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{sizer_3} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{text_ctrl_1}, 0, wxALIGN_CENTER|wxLEFT|wxRIGHT|wxTOP, 20);
    $self->{sizer_3}->Add($self->{button_3}, 0, wxALIGN_CENTER|wxLEFT|wxRIGHT, 5);
    $self->{sizer_3}->Add($self->{button_4}, 0, wxALIGN_CENTER|wxLEFT|wxRIGHT, 5);
    $self->{sizer_2}->Add($self->{sizer_3}, 1, wxEXPAND, 0);
    $self->SetSizer($self->{sizer_2});
    $self->Layout();
    # end wxGlade
}
1;

package MyDialog2;

use Wx qw[:everything];
use base qw(Wx::Dialog);
use strict;
use DBI;
use Cwd;
use Encode;

sub new {
    my( $self, $parent, $id, $title, $pos, $size, $style, $name ) = @_;
    $parent = undef              unless defined $parent;
    $id     = -1                 unless defined $id;
    $title  = ""                 unless defined $title;
    $pos    = wxDefaultPosition  unless defined $pos;
    $size   = wxDefaultSize      unless defined $size;
    $name   = ""                 unless defined $name;

	$style = wxDEFAULT_DIALOG_STYLE
	    unless defined $style;
    
	$self = $self->SUPER::new( $parent, $id, $title, $pos, $size, $style, $name );
    $self->{text_ctrl_2} = Wx::TextCtrl->new($self, 8,wxTE_PROCESS_ENTER,);
	$self->{text_ctrl_2}->Clear();
    $self->{button_5} = Wx::Button->new($self, 5, "IN/OUT",wxDefaultPosition, wxDefaultSize, wxBU_AUTODRAW);
    $self->{button_6} = Wx::Button->new($self, 6, "Quit");

    $self->__set_properties();
    $self->__do_layout();


Wx::Event::EVT_TEXT_ENTER($self,8,\&inout);
Wx::Event::EVT_BUTTON($self,5,\&inout);
Wx::Event::EVT_BUTTON($self,6,\&quitt);
    return $self;

}
sub quitt{
	system(exit(0));
}
sub inout{
	my $self=shift;

	my $number =$self->{text_ctrl_2}->GetValue();
	$self->{text_ctrl_2}->Clear() 
	&play($number);
	}

###################################################


sub play{
	
	my $dbfile	= "INOUT.db";
	my $dsn		= "dbi:SQLite:dbname=$dbfile";
	my $dbh		= DBI->connect($dsn);
	&now;
	
	my $barcode = shift;
	my $sth=$dbh->prepare("SELECT name FROM resi where num =$barcode");
	$sth->execute;
	my @row = $sth->fetchrow_array;
	my $name = shift(@row);
	#$name = decode("cp949",$name);
	my $flag = &check($name,$barcode);
	&now;
	if ($flag == 1) {
		$dbh->do("INSERT INTO \'$barcode\' (name,year,month,day,time,flag) VALUES (?,?,?,?,?,?)",
				  undef,
				  $name,$year,$mon,$mday,$time,$flag);
				
				   open FH, ">>", "$logpwd" or die "$!\n";
				   print FH &now;
				   print FH "$barcode"."th member Came to work.\n";
				   close FH;
		
					my $todat ="$year/$mon/$mday";
					$dbh->do("INSERT INTO Comprehensive (NAME,NUMBER,\'DATE\',\'IN\') VALUES (?,?,?,?)",
							undef,
							$name,$barcode,$todat,$time);
					$dbh->disconnect;
		}
	elsif($flag ==2) {
		$dbh->do("INSERT INTO \'$barcode\' (name,year,month,day,time,flag) VALUES (?,?,?,?,?,?)",
				  undef,
				  $name,$year,$mon,$mday,$time,$flag);

				   open FH, ">>", "$logpwd" or die "$!\n";
				   print FH &now;
				   print FH "$barcode"."th member Leave work.\n";
				   close FH;
	
		my $sth = $dbh->prepare("SELECT time FROM \'$barcode\' where num =$barcode and flag =2");
		$sth->execute;
		@row = $sth->fetchrow_array;
		my $intime = shift(@row);
		my @intime = split( /:/, $intime);
		my @outime = split( /:/, $time);
		my $sumtime = &timecalc(@intime,@outime);
		

		$time = "\'$time\'";
		my $todat ="\'$year/$mon/$mday\'";
		$dbh->do("UPDATE Comprehensive SET 'OUT'=$time,'TIME'=$sumtime WHERE NUMBER=$barcode AND DATE=$todat");	
		$dbh->disconnect;
}}




sub check{

	my $dbfile	= "INOUT.db";
	my $dsn		= "dbi:SQLite:dbname=$dbfile";
	my $dbh		= DBI->connect($dsn);
	&now;

	my $a=shift;
	my $num=shift;
	my $sth = $dbh->prepare("SELECT day FROM \'$num\' WHERE num=$num and month=$mon");
	$sth->execute;
	
	my @row = $sth->fetchrow_array;
	my $che = shift(@row);
	#출퇴근 여부 확인 출근시1 퇴근시2를 리턴
	if ($che eq $mday) {
		return 2;
	}
		else {
		return 1;
	}
}

sub now{
	($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime;
	$year = $year+1900; $mon++;
	if ($hour<10) {	$hour="0$hour";}
	if ($min<10) {	$min="0$min";}
	$time = "$hour:$min:$sec";											#출퇴근 시간용
	$now = $year."/".$mon."/".$mday." ".$hour.":".$min.":".$sec." ";	#로그용
	}



sub timecalc{
	my @ret;
	my $a=shift;
	my $b=shift;
	my $c=shift;
	my $d=shift;
	my $e=shift;
	my $f=shift;

	if ($c>$f) {
		$e--;
		$f=$f+60;
				
		if($b>$e){
			$d--;
			$e=$e+60;	}}
	$ret[2]=$f-$c;	
	$ret[1]=$e-$b;
	$ret[0]=$d-$a;
	if($ret[0]<10){$ret[0]="0$ret[0]";}
	if($ret[1]<10){$ret[1]="0$ret[1]";}
	my $ret="\'$ret[0]:$ret[1]:$ret[2]\'";
	return $ret;
}

######################################################

sub __set_properties {
    my $self = shift;
    # begin wxGlade: MyDialog1::__set_properties
    $self->SetTitle("##### Made SAnji #####");
    $self->SetSize(Wx::Size->new(200, 120));
    $self->{text_ctrl_2}->SetMinSize(Wx::Size->new(150, 23));
    $self->{button_5}->SetMinSize(Wx::Size->new(86, 26));
    $self->{button_6}->SetMinSize(Wx::Size->new(86, 26));
    # end wxGlade
}

sub __do_layout {
    my $self = shift;
    # begin wxGlade: MyDialog1::__do_layout
    $self->{sizer_4} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{sizer_5} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_4}->Add($self->{text_ctrl_2}, 0, wxALIGN_CENTER|wxLEFT|wxRIGHT|wxTOP, 20);
    $self->{sizer_5}->Add($self->{button_5}, 0, wxALIGN_CENTER|wxLEFT|wxRIGHT, 5);
    $self->{sizer_5}->Add($self->{button_6}, 0, wxALIGN_CENTER|wxLEFT|wxRIGHT, 5);
    $self->{sizer_4}->Add($self->{sizer_5}, 1, wxEXPAND, 0);
    $self->SetSizer($self->{sizer_4});
    $self->Layout();
    # end wxGlade
}
1;



package MyApp;
use base qw(Wx::App);
use strict;

sub OnInit {
    my( $self ) = shift;
	my $flag = shift;
	unless($flag){
		$flag=1;
	}
    Wx::InitAllImageHandlers();
    my $dialog = MyDialog->new();
    $self->SetTopWindow($dialog);
    $dialog->Show($flag);
    return 1;
}

package MyApp2;

use base qw(Wx::App);
use strict;

sub OnInit {
    my( $self ) = shift;
	my $flag = shift;
	unless($flag){
		$flag=1;
	}
    Wx::InitAllImageHandlers();
    my $dialog = MyDialog1->new();
    $self->SetTopWindow($dialog);
    $dialog->Show($flag);
    return 1;
}

package MyApp3;

use base qw(Wx::App);
use strict;

sub OnInit {
    my( $self ) = shift;
	my $flag = shift;
	unless($flag){
		$flag=1;
	}
    Wx::InitAllImageHandlers();
    my $dialog = MyDialog2->new();
    $self->SetTopWindow($dialog);
    $dialog->Show($flag);
    return 1;
}