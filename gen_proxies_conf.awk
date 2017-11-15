#!/bin/awk -f
BEGIN {
    print "server {"
    print "  listen 80;"
    print

    proxies_len = split(ENVIRON["PROXIES"], proxies, ";");

    for (i = 1; i < proxies_len + 1; i++) {

        split(proxies[i], proxy, "->")

        print "  location", proxy[1], "{"
        print "    proxy_pass", proxy[2] ";"
        print "  }"
    }

    print "}"
}
