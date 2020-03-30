#! /bin/bash

iptables-save > /root/iptables_BKP_$(date +"%d-%b-%Y")
iptables -A INPUT -s 10.105.0.1/255.255.255.255 -j ACCEPT
iptables -A INPUT -s 10.104.0.13/255.255.255.255 -j ACCEPT
iptables -A OUTPUT -s 10.106.0.1/255.255.255.255 -j ACCEPT
iptables -A OUTPUT -s 10.106.0.13/255.255.255.255 -j ACCEPT
/etc/init.d/iptables save
cp /etc/hosts.allow /etc/hosts.allow_BKP_$(date +"%d-%b-%Y")
sed -i "s/^ALL:.*/&, 10.106.0.1\/255.255.255.255, 10.106.0.13\/255.255.255.255/" /etc/hosts.allow
