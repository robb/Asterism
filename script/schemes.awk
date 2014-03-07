BEGIN {
    FS = "\n";
}

/Targets:/ {
    while (getline && $0 != "") {
        if ($0 ~ /Spec/) continue;

        sub(/^ +/, "");
        print "'" $0 "'";
    }
}
