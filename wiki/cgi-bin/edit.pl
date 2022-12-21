#!/usr/bin/perl

use strict;
use warnings;
use CGI;
use utf8;

my $q = CGI->new;
my $fileName = $q->param('fileName');

my $line;

print $q->header('text/html');
print <<HTML;
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../CSS/estilosNH.css">
    <title>Wiki</title>
</head>

<body>
    <section class="cuerpo">
        <h2>Creating a new Web Page</h2>
        <form action="./createWP.pl" method="post">
            <div class="content">
                <h4>
                    Type a title:
                </h4>
                <input type="text" name="fileName" class="cajaTitulo" value="$fileName" required readonly>
                <h4>
                    Type the content with Markdown format:
                </h4>
                <textarea name="txtA" class="cajaContent" required>
HTML

open(FILE, "../markdownFiles/".$fileName.".md") or die "Error";
while($line = <FILE>){
    print $line;
}
close(FILE);

print <<HTML;
                </textarea>
                <div class="nextbotc">
                    <input type="submit" value="Save code" class="buttonNH">
                    <input type="button" value="Atras" onclick="location.href='show.pl'" class="buttonNH">
                    <input type="button" value="Save and show" onclick="location.href='#'" class="buttonNH">
                </div>
            </div>
        </form>
    </section>

</body>

</html>
HTML

exit;