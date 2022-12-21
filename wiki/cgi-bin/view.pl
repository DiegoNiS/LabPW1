#!D:\XAMP\perl\bin\perl.exe

use strict;
use warnings;
use CGI;

sub comFormato{
    my $cadena = $_[0];
    if($cadena =~ /(.*)\*\*\*(.*)\*\*\*(.*)/){
        return $1."<b><i>".$2."</i></b>".comFormato($3);
    }elsif($cadena =~ /(.*)\*\*(.*)\*\*(.*)/){
        return $1."<b>".$2."</b>".comFormato($3);
    }elsif($cadena =~ /(.*)\*(.*)\*(.*)/){
        return $1."<i>".$2."</i>".comFormato($3);
    }elsif($cadena =~ /(.*)_(.*)_(.*)/){
        return $1."<i>".$2."</i>".comFormato($3);
    }else{
        return $cadena;
    }
}

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

my $parraf;

open(FILE, "../markdownFiles/".$fileName.".md") or die "Error";
while($line = <FILE>){
    if($line =~/^#* /){ #title section
        if($line =~/^# /){
            print "<h2 class='h1'>".substr($line, 2)."</h2>";
        }
        elsif($line =~/^## /){
            print "<h2>".substr($line, 3)."</h2>\n";
        }
        elsif($line =~/^### /){
            print "<h3>".substr($line, 4)."</h3>\n";
        }
        elsif($line =~/^#### /){
            print "<h4>".substr($line, 5)."</h4>\n";
        }
        elsif($line =~/^##### /){
            print "<h5>".substr($line, 6)."</h5>\n";
        }
        else {
            print "<h6>".substr($line, 7)."</h6>\n";
        }
    }
    elsif((length($line)eq 2) && !(length($parraf) eq 0)){
        print OUT "<p>\n$parraf</p>\n";
        $parraf="";
    }
    elsif(length($line) > 2){
        $line = comFormato($line);
        $parraf=$parraf.$line;
    }
}
print OUT "<p>\n$parraf</p>\n";
close(FILE);

print <<HTML;
        </div>
    </section>
</body>

</html>
HTML

exit;