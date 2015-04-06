#!/usr/bin/perl -w

# Script to illustrate how to parse a simple XML file
# and dump its contents in a Perl hash record.

use strict;
use XML::Simple;
use Data::Dumper;

my $booklist = XMLin('booklist.xml');

print Dumper($booklist);
