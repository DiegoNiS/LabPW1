#!/usr/bin/perl

use strict;
use warnings;
use CGI;
use utf8;

my $q = CGI->new;
my $fileName;
my $fileName_;
print $q-> header('text/html');
print <<HTML;
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../CSS/estilos.css">
    <title>Wiki</title>
</head>
<body>
    <section class="cuerpo">
        <h1>Nuestras páginas de Wiki</h1>

        <div class="contenedor">
            <h2>
                List of saved files:
            </h2>
            <ul class="lista">
HTML

opendir(D, "../markdownFiles") or die "No se pudo abrir el directorio!\n";
my @list = readdir(D);
closedir(D);

foreach my $f (@list){
    if(length($f)>3 && substr($f, -3) eq ".md"){
        $fileName_ = substr($f, 0, -3);
        $fileName = join(" ", split("_", substr($f, 0, -3)));
        print "<li class='item'><div class='urlItem'>Item:<a href='../markdownFiles/%fileName_.md'>$fileName</a></div><div class='divfrm'>";
        print "<form class='frm' action='./delete.pl'><input type='hidden' name='fileName' value='$fileName_'><input type='submit' class='btn' value='delete this'>";
        print "</form><form class='frm' action='./edit.pl'><input type='hidden' name='fileName' value='$fileName_'><input type='submit' class='btn' value='edit this'></form>";
        print "<form class='frm' action='./view.pl'><input type='hidden' name='fileName' value='$fileName_'><input type='submit' class='btn' value='show this'></form></div></li>";
    }
}

print <<HTML;
            </ul>
        </div>
        <div class="botonmenu">
            <a href="../newhtml.html">Nueva página</a>
            <a href="../index.html">Volver al inicio</a>
        </div>
    </section>

</body>

</html>
HTML

exit;