$/="\/\/\n";
while (<>){
    if ($_=~/^AC\s{3}(.*?)\;/m){
        print ">$1\n";
    }

    while ($_=~/^\s{5}(.*)/mg){
        $sequence=$1;
        $sequence=~s/\s//g;
        print "$sequence";
    }

    print "\n";
}