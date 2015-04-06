#!/usr/bin/perl -w

# Script to illustrate how to parse a simple XML file
# and dump its contents in a Perl hash record.

use strict;
use XML::Simple;
use Data::Dumper;

# check for the correct number of command-line args
if (($#ARGV + 1) != 1) {
    print "\nUsage: xmlsimpleRead.pl repoRecordFile_name\n";
    exit;
}

my $booklist = XMLin($ARGV[0]);

print Dumper($booklist);
