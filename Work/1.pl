#!/usr/bin/perl
$f = 0;

$A = <STDIN>;
$AA = $A / 36 ;
$AAA = $A % 36;
&calc($AAA);


sub calc{

	$_ = $_[0] % 36;

	if($_ == '1'){
	$f=1;
	}
	elsif($_=='2'){
	$f=2;
	}
	elsif($_=='3'){
	$f=3;
	}
	elsif($_=='4'){
	$f=4;
	}
	elsif($_=='5'){
	$f=5;
	}
	elsif($_=='6'){
	$f=6;
	}
	elsif($_=='7'){
	$f=7;
	}
	elsif($_=='8'){
	$f=8;
	}
	elsif($_=='9'){
	$f=9;
	}
	elsif($_=='10'){
	$f='A';
	}
	elsif($_=='11'){
	$f='B';
	}
	elsif($_=='12'){
	$f='C';
	}
	elsif($_=='13'){
	$f='D';
	}
	elsif($_=='14'){
	$f='E';
	}
	elsif($_=='15'){
	$f='F';
	}
	elsif($_=='16'){
	$f='G';
	}
	elsif($_=='17'){
	$f='H';
	}
	elsif($_=='18'){
	$f='I';
	}
	elsif($_=='19'){
	$f='J';
	}
	elsif($_=='20'){
	$f='K';
	}
	elsif($_=='21'){
	$f='L';
	}
	elsif($_=='22'){
	$f='M';
	}
	elsif($_=='23'){
	$f='N';
	}
	elsif($_=='24'){
	$f='O';
	}
	elsif($_=='25'){
	$f='P';
	}
	elsif($_=='26'){
	$f='Q';
	}
	elsif($_=='27'){
	$f='R';
	}
	elsif($_=='28'){
	$f='S';
	}
	elsif($_=='29'){
	$f='T';
	}
	elsif($_=='30'){
	$f='U';
	}
	elsif($_=='31'){
	$f='V';
	}
	elsif($_=='32'){
	$f='W';
	}
	elsif($_=='33'){
	$f='Y';
	}
	elsif($_=='34'){
	$f='X';
	}
	elsif($_=='35'){
	$f='Z';
	}

}
