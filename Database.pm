package Database;

use warnings;
use strict;

use DBI;

my $db_connect_string = qq(dbi::Oracle::$ENV{ORA_DSN}) unless ! $ENV{ORA_DSN};
my $db_username = $ENV{ORA_USER} unless ! $ENV{ORA_USER};
my $db_password = $ENV{ORA_PASS} unless ! $ENV{ORA_PASS};

sub db_connect {
  return DBI->connect_cached("$db_connect_string", "$db_username", "$db_password",
    { RootClass => "DBIx::ContectualFetch", AutoCommit => 0 } )
    or die $DBI::errstr;
}

1;
