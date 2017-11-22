use PDF::Reuse;
use PDF::Reuse::Barcode;
use Barcode::Code128;
use Cwd;

# &barcode(A,B) => file name.
# barcode size : Modified line 16~ 

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