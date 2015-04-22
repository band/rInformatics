#!/usr/bin/perl -w

use strict;
use XML::Twig;

my $file = 'repositories_0324.xml';
my $twig = XML::Twig->new();

$twig->parsefile($file);

my $root = $twig->root;

print $root;
print "\n";

foreach my $repo ($root->children('repository')){
    print $repo->first_child_text('id');
    print ' (' . $repo->first_child_text('name') . ') ';
    print $repo->first_child('link')->att('rel');
    print "\n";
}
