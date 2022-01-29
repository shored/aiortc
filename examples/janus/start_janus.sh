#!/bin/sh

SRV_URL=http://10.249.240.100:8088/janus

for i in 1 2 3 4
do
	ip netns exec test$i /home/ubuntu/aiortc/examples/janus/janus.py --room 1234 $SRV_URL &
	sleep 10
done
