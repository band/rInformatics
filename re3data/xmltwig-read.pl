#!/usr/bin/perl -w

use strict;
use XML::Twig;

# check for the correct number of command-line args
if (($#ARGV + 1) != 1) {
    print "\nUsage: xml-twigreadRepo.pl repoRecordFile_name\n";
    exit;
}

my $twig = XML::Twig->new();
$twig->parsefile($ARGV[0]);
my $root = $twig->root;

#my $mdfields = $root->children;

foreach my $mdfield ($root->children) {
    $mdfield->print;

#print $root->first_child_text('re3data.orgIdentifier');
#print $root->first_child_text('repositoryName');
#print ' (' . $root->first_child_text('type') . ') ';

    print "\n";
}

