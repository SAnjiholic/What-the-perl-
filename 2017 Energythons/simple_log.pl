use Cwd;

sub madelog{
my $logpwd = getcwd."/log.txt";
unless(-f $logpwd) {
	system("type NUL > $logpwd");}
	}
