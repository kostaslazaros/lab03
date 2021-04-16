# line separator is ">"
$/=">";
while (<>){
    $entry=$_;
    chop $entry;
    $entry= ">"."$entry";
    $entry=~/>(.+?)\n(.*)/g;
    $name=$1;
    $sequence=$2;
    $sequence=~s/\s//g;
    if ($name ne ""){
        print ">$name\n$sequence\n";
    }
}

