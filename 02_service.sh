#!/bin/sh

# iptables
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT

iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 2589 -j ACCEPT

iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT

service iptables save
iptables -L

# sshd
echo 'next action:'
echo '$ vim /etc/ssh/sshd_config'
echo '> Port 2589'
echo '> PermitRootLogin no'
echo '> PasswordAuthentication no'
echo '$ service sshd restart'
echo
echo 'memo: mackerel.io setup'
