#!/bin/sh

SRV_URL=http://10.249.240.100:8088/janus
DURATION=1800
IPADDR=$(ip addr show dev eth0 | grep 'inet '| awk '{print $2}')

for i in 1 2 3
do
	ip netns exec test$i env LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libgomp.so.1 /home/ubuntu/aiortc/examples/janus/janus.py --verbose --room 1234 --duration $DURATION --display $IPADDR:$i $SRV_URL 2>&1| grep '<' > $i.result&
	sleep 10
done
