#!/bin/sh

SCENARIO=$1
NODENUM=$2
NUMINT=$3

if [ $# -ne 3 ]; then
	echo 'usage: start_janus.sh <scenarion> <node_id> <num_interfaces>'
	exit -1
fi

SRV_URL=http://10.249.240.100:8088/janus
DURATION=900
IPADDR=$(ip addr show dev eth0 | grep 'inet '| awk '{print $2}')

for i in $(seq 1 $NUMINT)
do
	ip netns exec test$i env LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libgomp.so.1 /home/ubuntu/aiortc/examples/janus/janus.py --verbose --room 1234 --duration $DURATION --display $IPADDR:$i $SRV_URL 2>&1| grep '<' > $SCENARIO-$NODENUM-$i.result&
	sleep 10
done
