#!/usr/bin/perl -w

use strict;
use XML::Twig;

# quit if there are not the correct number of command-line args
if (($#ARGV + 1) != 1) {
    print "\nUsage: xml-twigreadRepo.pl file_name\n";
    exit;
}

my $file = $ARGV[0];
my $twig = XML::Twig->new();

$twig->parsefile($file);

my $root = $twig->root;

print $root->first_child_text('repositoryName');
print ' (' . $root->first_child_text('type') . ') ';
print "\n";

#    print $repo->first_child('link')->att('rel');
