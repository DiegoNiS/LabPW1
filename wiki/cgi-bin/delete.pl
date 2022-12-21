#!D:\XAMP\perl\bin\perl.exe

use strict;
use warnings;
use CGI;

my $q = CGI->new;
my $fileName = $q->param("fileName");

unlink ("../markdownFiles/".$fileName.".md");
print $q->redirect("./show.pl");

exit;