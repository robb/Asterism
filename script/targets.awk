BEGIN {
    FS = "\n";
}

/Targets:/ {
    while (getline && $0 != "") {
        if ($0 ~ /Specs/) continue;

        sub(/^ +/, "");
        print "'" $0 "'";
    }
}
