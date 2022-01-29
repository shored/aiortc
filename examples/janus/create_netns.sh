#!/bin/sh

for i in 1 2 3 4
do
	ip netns add test$i
done
