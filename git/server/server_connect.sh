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


GRN='\033[0;32m'
NC='\033[0m'

printf "\n"
echo "Enter the IP Address of server"
read server_ip
echo "Enter the port to connect"
read server_port
echo -e "$server_ip\n$server_port" > $PWD/server/server_info.txt
echo -e "${GRN}\nAttempting to connect to server...${NC}"
nc $server_ip $server_port > $PWD/server/server_status.txt
cat $PWD/server/server_status.txt;

