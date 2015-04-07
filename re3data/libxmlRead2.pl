#!/usr/bin/perl -w

# Script to illustrate how to parse a simple XML file
# and dump its contents in a Perl hash record.

use strict;
use XML::LibXML;
use Data::Dumper;

# check for the correct number of command-line args
if (($#ARGV + 1) != 1) {
    print "\nUsage: xmlsimpleRead.pl repoRecordFile_name\n";
    exit;
}

my $parser = XML::LibXML->new();
my $doc    = $parser->parse_file($ARGV[0]);

print $_->data . "\n" foreach ($doc->findnodes('//repository/contentType/text()'));
print $_->data . "\n" foreach ($doc->findnodes('//repository/policy/policyName/text()'));
print $_->data . "\n" foreach ($doc->findnodes('//repository/dataAccess/dataAccessType/text()'));

