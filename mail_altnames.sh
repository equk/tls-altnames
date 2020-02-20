#!/bin/bash
#
#*****************************************************************
#     mail_altnames - equk.co.uk
#*****************************************************************
# This script lists alternate names found in TLS certificates
# for a given domain in order to find possible subdomains.
#*****************************************************************
# Copyright (c) 2016 B.Walden.  All rights reserved.
# LICENSE: MIT (LICENSE file should be included with script)

# COLORS

blue="\033[1;34m"
green="\033[1;32m"
red="\033[1;31m"
bold="\033[1;37m"
reset="\033[0m"

# VARIABLES

initial_domain=$1
day=$(date '+%d/%m/%Y')
gplus="[$green+$reset]"
bplus="[$blue+$reset]"

# MAIN FUNCTION

tls_altnames() {
    echo |
        # get TLS via SMTP
        openssl s_client -connect ${1}:25 -starttls smtp 2>&1 | openssl x509 -text |
        # find X509v3 Subject Alternative Name
        sed -nr '/^ {12}X509v3 Subject Alternative Name/{n;s/^ *//p}' |
        # cleanup text
        tr ', ' '\n' |
        # output each DNS: entry
        while read entry; do
            case "$entry" in
            DNS:*) echo ${entry#*:} ;;
            esac
        done
}

if [ $# -eq 0 ]; then
    echo -e "$red ERROR:$reset no arguments specified"
    echo -e "Please provide a domain to lookup"
    exit 0
fi

# OUTPUT TEXT

echo -e "$gplus Getting TLS over SMTP for [ $green ${initial_domain} $reset ]"
echo -e "$bplus Checking for Subject Alt Names"
echo -e ""

# EXECUTE MAIN FUNCTION

tls_altnames ${1}
