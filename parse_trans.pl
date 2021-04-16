while (<>){
    if ($_ =~/^AC\s{3}(.*?)\;/){
        print ">$1\n";
    }
    if($_=~/^\s{5}(.*)/){
        $sequence = $1;
        $sequence =~ s/\s//g ;
        print "$sequence";
    }
}
print "\n";
