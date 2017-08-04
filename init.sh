#!/usr/bin/env bash

iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD

iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT


ip6tables -F INPUT
ip6tables -F OUTPUT
ip6tables -F FORWARD

ip6tables -P INPUT DROP
ip6tables -P OUTPUT ACCEPT
ip6tables -P FORWARD ACCEPT

ip6tables -A INPUT -i lo -j ACCEPT
ip6tables -A INPUT -m state --state ESTABLISHED -j ACCEPT
ip6tables -A INPUT -s fe80::/10 -j ACCEPT
ip6tables -A INPUT -p ipv6-icmp -j ACCEPT
