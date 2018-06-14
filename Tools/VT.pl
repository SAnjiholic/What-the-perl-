use LWP::UserAgent;
use JSON;

#Code to submit a file to Virus Total
unless ($ARGV[0]) {print "insert file name\n"; exit(1);}

my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 1 });
my $url='https://www.virustotal.com/vtapi/v2/file/scan';
my $key='06c81a71583c1e45a632b8e3513dab1a2d6fb52b8efb534aa48bfafeb3cdffaa';

my $response = $ua->post( $url,
		Content_Type => 'multipart/form-data',
		Content => ['apikey' => $key,
		'file' => [$ARGV[0]]]
		);
die "$url error: ", $response->status_line
unless $response->is_success;
my $results=$response->content;

#pulls the sha256 value out of the JSON response
my $json = JSON->new->allow_nonref;   
my $decjson = $json->decode( $results);
my $sha256=$decjson->{"sha256"};

#Code to retrieve the results that pertain to a submitted file by hash value
$url='https://www.virustotal.com/vtapi/v2/file/report';

$response = $ua->post( $url,
		['apikey' => $key,
		'resource' => $sha256]
		);
die "$url error: ", $response->status_line
unless $response->is_success;
$results=$response->content;

$json = JSON->new->allow_nonref;   
$decjson = $json->decode($results);

# print selected values from the json file
print "-----------------------------------------------------------------------\n";
print "Sample name: ". $ARGV[0]."\n";
print "Scan ID:  ".$decjson->{"scan_id"}."\n";
print "Scan Date:  ".$decjson->{"scan_date"}."\n";
print "SHA256: ".$decjson->{"sha256"}."\n";
print "MD5: ".$decjson->{"md5"}."\n";
print "Detection rate: ".$decjson->{"positives"}. "/".$decjson->{"total"}."\n";
print "Verbose Message: ".$decjson->{"verbose_msg"}."\n";
print "-----------------------------------------------------------------------\n";
unless ($decjson->{"positives"} == 0) { print "Scan results\n";
	for my $key1 ( sort keys %$decjson ) {
		for my $key2 ( sort keys %{$decjson->{ $key1 }} ) {
			for my $key3 ( sort keys %{$decjson->{ $key1 }->{ $key2 }} ) {
				if ($key3 =~ /detected/ & $decjson->{$key1}->{$key2}->{$key3} == 0){last;}
				print "\t$key2\n"; # key2 = name;
				print "\t\t$key3 => $decjson->{ $key1 }->{ $key2 }->{ $key3 }\n";
			}
		}

	}
}
print "\nURL: ".$decjson->{"permalink"}."\n";
