#!/usr/bin/perl

use strict;
use warnings;
use feature qw/say/;
use DBI;
use Parse::Syslog;
# Importing the Database interface to be used to connect to the PostgresSQL database.

say "Please enter the DB name to which you are trying to connect:";
my $dbname = <STDIN>;
chomp $dbname;

say "Enter the host ip or localhost:";
my $host = <STDIN>;
chomp $host;

say "Enter the port number of the DB:";
my $port = <STDIN>;
chomp $port;

say "Enter your username:";
my $username = <STDIN>;
chomp $username;

say "Enter your password:";
my $password = <STDIN>;
chomp $password;

my $connection = DBI->connect("dbi:Pg:dbname=$dbname; host=$host; port=$port",
    $username,
    $password,
    {
        AutoCommit => 0, RaiseError => 1
    }) || die $DBI::errstr;

say "Please enter the table name:";
my $table_name = <STDIN>;
chomp $table_name;

# Create a table
my $SQL = "CREATE TABLE population (
                  ID SERIAL PRIMARY KEY,
                  NAME VARCHAR(100),
          )";
my $sth = '';
$sth = $connection->do($SQL);
$connection->commit or die $DBI::errstr;