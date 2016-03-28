BEGIN {
    FS = "\n";
}

/Targets:/ {
    while (getline && $0 != "") {
        if ($0 ~ /AsterismTests/) continue;

        sub(/^ +/, "");
        print "'" $0 "'";
    }
}
