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

ls * | chmod +x *.sh
echo "======Installation Process Started======"
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
sudo apt-get install aircrack-ng
sudo apt-get install figlet
sudo apt-get install zenity
sudo apt-get install python
sudo apt-get install xterm
sudo apt-get install ettercap-text-only
sudo apt-get install metasploit-framework
sudo apt-get install tshark
sudo apt-get install netcat
sudo apt-get install reaver
sudo apt-get install mutt
