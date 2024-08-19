#!/bin/sh -l

echo "Host $1" >> /root/.ssh/config
echo "ProxyCommand cloudflared access ssh --hostname %h --id $7 --secret $8" >> /root/.ssh/config
echo "$5" > /root/.ssh/$4
chmod 600 /root/.ssh/$4

ssh-keyscan $1 >> /root/.ssh/known_hosts

ssh -T -q -o StrictHostKeyChecking=no $3@$1

ssh -i /root/.ssh/$4 $3@$1 -p $2 "$6"
