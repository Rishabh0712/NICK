red='\033[32;31m'
nc='\033[0m'
grn='\033[0;32m'
bold='\e[32;1m'
pln='\e[0m'

echo -e "${bold}${red}You have entered emergency mode${nc}${pln}"
echo -e "${bold}${grn}Tell the pin to continue${nc}${pln}"
read pin;
if [ $pin -eq 0712 ]
then
  echo "Pin accepted. Tell the code"
  read code;
  if [ $code -eq 0010 ]
  then
  echo "Final call is yours"
  read potime;
  shutdown -P $potime
  elif [ $code -eq 1111 ]
  then
    poweroff;
  fi
fi

