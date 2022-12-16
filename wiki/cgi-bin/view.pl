#!D:\XAMP\perl\bin\perl.exe

use strict;
use warnings;
use CGI;

my $q = CGI->new;
my $line;
my $fileName = $q->param('fileName');

print $q->header("text/html");
print <<HTML;
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../CSS/estilosV.css">
    <title>Wiki</title>
</head>

<body>
    <section class="cuerpo">
        <h1 class="si">Wiki - Web</h1>

        <div class="contenedorV">
HTML

open(FILE, "../markdownFiles/".$fileName.".md") or die "Error";
while($line = <FILE>){
    if($line =~/^(# )/){
        print "<h2 class='h1'>".substr($line, 2)."</h2>";
    }
    elsif($line =~/^(## )/){
        print "<h2>".substr($line, 3)."</h2>\n";
    }
    elsif($line =~/^(### )/){
        print "<h3>".substr($line, 4)."</h3>\n";
    }
    elsif($line =~/^(#### )/){
        print "<h4>".substr($line, 5)."</h4>\n";
    }
    elsif($line =~/^(##### )/){
        print "<h5>".substr($line, 6)."</h5>\n";
    }
    elsif($line =~/^(###### )/){
        print "<h6>".substr($line, 7)."</h6>\n";
    }
    elsif($line eq "\n"){
        print "<br>\n";
    }
    else{
        print "<p>".$line."</p>\n";
    }
}
close(FILE);

print <<HTML;
        </div>
    </section>
</body>

</html>
HTML

exit;