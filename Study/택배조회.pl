use Parcel::Track;
use Encode qw( decode_utf8 );
use strict;
use warnings;

binmode STDOUT, ':encoding(cp949)';

 
my $flag;

my $info = << 'END_INFO'; 
*********************************
1. 한진
2. 동부
3. CJ
4. KGB
5. 우체국
6. 노란모자

숫자만 입력하세요

!! 로젠은 개새끼라 없습니다 !! 
**********************************



END_INFO

print decode_utf8($info);




while(1){
print decode_utf8("택배사를 입력하세요 : ");
my $company = <STDIN>;
chomp $company;

if ($company == 1 ) {
		$flag = 'KR::Hanjin';
		last;
}
elsif ($company == 2 ) {
		$flag = 'KR::Dongbu';
		last;
}

elsif ($company == 3 ) {
		$flag = 'KR::CJKorea';
		last;
}

elsif ($company == 4) {
		$flag = 'KR::KGB';
		last;
}

elsif ($company == 5 ) {
		$flag = 'KR::PostOffice';
		last;
}

elsif ($company == 6 ) {
		$flag = 'KR::Yellowcap';
		last;
}
else {
	print decode_utf8("숫자만 입력하세요\n");
}
}
#print $flag;
print decode_utf8("송장번호를 입력하세요 : ");
my $num = <STDIN>;
chomp $num;


# Create a tracker
my $tracker = Parcel::Track->new( $flag, $num );

my $result = $tracker->track;

 
# Get the information what you want.
if ( $result ) {
    print decode_utf8( "$result->{from}\n" );
    print decode_utf8( "$result->{to}\n" );
    print decode_utf8( "$result->{result}\n" );
    print decode_utf8("$_\n") for @{ $result->{descs} };
   # print decode_utf8("$_\n") for @{ $result->{htmls} };
	system("pause");
}
else {
    print "Failed to track information\n";
}

