#!/usr/bin/perl -w

# Script to illustrate how to parse a simple XML file
# and dump its contents in a Perl hash record.

use strict;
use XML::LibXML;
use Data::Dumper;

# check for the correct number of command-line args
if (($#ARGV + 1) != 1) {
    print "\nUsage: libxmlRead2.pl repoRecordFile_name\n";
    exit;
}

my $parser = XML::LibXML->new();
my $doc    = $parser->parse_file($ARGV[0]);

my $xpc = XML::LibXML::XPathContext->new($doc);
$xpc->registerNs(rd3 => 'http://re3data.org/schema/2-2');

foreach my $node ($xpc->findnodes('//r3d:contentType')) {
  print $node->to_literal, "\n";
}

#print $_->data . "\n" foreach ($doc->findnodes('//repository/contentType/text()'));
print $_->data . "\n" foreach ($xpc->findnodes('//r3d:repository/r3d:policy/r3d:policyName/text()'));
print $_->data . "\n" foreach ($xpc->findnodes('//repository/dataAccess/dataAccessType/text()'));
