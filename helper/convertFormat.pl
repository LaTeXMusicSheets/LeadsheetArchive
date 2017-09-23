#!/usr/bin/perl

use strict;
use warnings;

$^I = '.bak'; # create a backup copy

while (<>) {
   s/ -- /\}\n\\songpart\{/g; # do the replacement
   s/\\begin\{schedule\}\R?(?!\\songpart\{)/\\begin\{schedule\}\n\\songpart\{/g; # do the replacement
   s/(?!\})\R?\\end\{schedule\}/\n\\end\{schedule\}/g; # do the replacement
   s/\\songpart\{(\w\d?)(?!\})\R/\\songpart\{$1\}/gms; # do the replacement

   print; # print to the modified file
}

unlink glob "*.bak";
