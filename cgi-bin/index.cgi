#!/usr/bin/perl

use strict;
use warnings;
use feature qw/say/;

print "Content-type: text/html\n\n";

print "<!DOCTYPE HTML>";
print "<html>";
print "<head>";
print "<title>CGI Test Page</title>";
print "</head>";
print "<h1>This is a shit h1 tag title</h1>";

for (my $i = 0; $i < 20; $i++) {
    say "$i</br>";
}

my($disk, $available, $dir);
$disk = system("df -h | grep GB");

# This will allow me to print all the events happening in the pc.
#$counter = 0;
#while(){
#	say $counter;
#	$counter = $counter + 1;
#}

print "If this works, I'll kill myself, legit[!]";
