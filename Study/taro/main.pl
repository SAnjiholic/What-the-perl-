use Tk;
use Tk::DialogBox;
use Tk::MsgBox;

$main = MainWindow->new();
			
			

$main ->Entry ( -text	=> "",
				-width =>15,
				-font => "Arial 20") -> pack();
$main->Button(	-text   =>"Click",
				-command=>$main->Entry (-text => "11")->pack(),
				-width=>15,
				-font => "Arial 20")   ->pack();#-side=>"top");
$main ->Label ( -text	=> "",
				-width =>15,
				-font => "Arial 20") -> pack();
				$main->geometry("250x150");
				   
MainLoop;