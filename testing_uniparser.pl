#!/usr/bin/perl

$/="\/\/\n";

while (<>){

    if ($_=~/^ID\s{3}(.*?)\s+(.*?)\;\s+(\d+\sAA.)/m){

        print ">$1";

    }

    if ($_=~/^AC\s{3}(.*?)\;/m){

        print "|$1";

    }

    if ($_=~/^SQ\s{3}SEQUENCE\s+(.*?)\;/m){

        $sequence_length_aa = $1;
        print "|$sequence_length_aa\n";
        $sequence_length_numeric = $sequence_length_aa;
        $sequence_length_numeric =~ s/\D//g;

    }

    @tmstart = ();
    @tmend = ();

    while ($_=~/^FT\s{3}TRANSMEM\s+(\d+)\s+(\d+)\s+(.*)\./mg){
        push(@tmstart, $1);
        push(@tmend, $2);
        print "Transmembrane interval: $1-$2\n";
    }

    while ($_=~/^\s{5}(.*)/mg){
        $sequence=$1;
        $sequence=~s/\s//g;
        print $sequence;
    }

    print "\n";
    $lines = "-" x $sequence_length_numeric ;
    $length = @tmstart;

    for($k = 0; $k < $length; $k++){
        
        for($i = @tmstart[$k] - 1; $i < @tmend[$k]; $i++){

            substr($lines,$i,1,"M");
        }
    }

    print "$lines";
    print "\n\n";
}
