
sub rgsmsg{
my $test = "register Success";
my $mw = $main->Toplevel;
$mw->title("register Success!");
$mw->Label( -text => "$test",
			-font => "Arial 20")->pack;


sub okmsg{
my $test = "Save Success\n".$_[0]." add cycle ".$_[1]."\nTotal Count : ".$_[2];
my $mw = $main->Toplevel;
$mw->title("Save Success!");
$mw->Label( -text => "$test",
			-font => "Arial 15")->pack;
