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
    <link rel="stylesheet" href="../CSS/estilos.css">
    <title>Wiki</title>
</head>

<body>
    <section class="cuerpo">
        <h1>Wiki - Web</h1>

        <div class="contenedor">
HTML

open(FILE, "../markdownFiles/".$fileName.".md") or die "Error";
while($line = <FILE>){
    print $line;
}
close(FILE);

print <<HTML;
        </div>
    </section>
</body>

</html>
HTML

exit;