#!/bin/sh

for i in 1 2 3 4
do
	ip netns exec test$i /sbin/wpa_supplicant -c /run/netplan/wpa-wlan$i.conf -iwlan$i&
	ip netns exec test$i dhclient wlan$i
done
