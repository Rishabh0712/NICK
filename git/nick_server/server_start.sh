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

figlet -f big "N.I.C.K SERVER"
echo -e "[+]${BOLD}${GRN} Server Started...${NC}${PLN}"
ncat -k -l -p 4444  -e ./server_connected.sh &
sleep 1 
ncat -k -l -p 4445 -e ./inf_media.sh &
sleep 1
ncat -k -l -p 4446 -e ./phishing.sh &
sleep 1
ncat -k -l -p 4447 -e ./dos.sh &
sleep 1
ncat -k -p 4448 -e ./emergecy.sh
sleep 1
