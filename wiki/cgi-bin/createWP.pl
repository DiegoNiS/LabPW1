#!/usr/bin/perl

use strict;
use warnings;
use CGI;

my $q = CGI->new;
my $code = $q->param('txtA');
my $fileName = $q->param('fileName');

$fileName = join("_", split(" ", $fileName));

open(ARC, ">../markdownFiles/".$fileName.".md") or die "Error creating a new .md";

print ARC $code;

close(ARC);

print $q->redirect("./show.pl");

exit;