#!/bin/sh
set -e

# generate nginx configuration
awk -f gen_proxies_conf.awk > /etc/nginx/conf.d/default.conf

exec "$@"
