#!/usr/bin/env bash

#check for files
if [ -f /etc/rc.local ]; then
    echo "/etc/rc.local exists, not doing anything"
    exit 1
elif [ -f /etc/iptables.rules ]; then
    echo "/etc/iptables.rules exists, not doing anything"
    exit 1
elif [ -f /etc/iptables.rules ]; then
    echo "/etc/ip6tables.rules exists, not doing anything"
    exit 1
fi

./init.sh

iptables-save > /etc/iptables.rules
ip6tables-save > /etc/ip6tables.rules

echo "#!/usr/bin/sh" > /etc/rc.local
echo "iptables-restore < /etc/iptables.rules" >> /etc/rc.local
echo "ip6tables-restore < /etc/ip6tables.rules" >> /etc/rc.local
chmod +x /etc/rc.local

