#!/usr/bin/env sh
LOCAL_IP=`curl -s http://169.254.169.254/latest/meta-data/local-ipv4`
INTANCE_ID=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
AZ=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone | head -c -1`

/bin/consul $* -node="$INTANCE_ID" -advertise="$LOCAL_IP" -dc="$AZ"
