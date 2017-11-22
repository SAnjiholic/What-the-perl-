use DBI;

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
