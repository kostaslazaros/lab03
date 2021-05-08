#!/usr/bin/perl

while (<>)
{
    $line = $_;
    chomp $line;
    if ($line=~m/^>/g) {
        print "$line \n";
    }
    else {
        print $line;
    }
}

print "\n";