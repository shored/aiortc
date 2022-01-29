#!/bin/sh

for i in 1 2 3 4
do
	iw phy phy$i set netns "$(ip netns exec test$i sh -c 'sleep 1 >&- & echo "$!"')"
done

netplan apply
