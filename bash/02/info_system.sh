#!/bin/bash


hostname=$HOSTNAME
timezone=$(timedatectl | grep 'Time zone' | awk '{print $3, $4, $5}');
user=$USER
system_os=`cat /etc/issue`
date=`date | awk '{print $2, $3, $4, $5}'`
uptime=`uptime -p | awk '{print $2, $3, $4, $5}'`
uptime_sec=`cat /proc/uptime | awk  '{print $2}'`
ip=`ip -o -f inet addr show | awk  '{print $4}' | cut -d/ -f1` 
mask=`ip -o -f inet addr show | awk  '{print $4}' | cut -d/ -f2`
gateway=`ip route show default | head -n 1 | awk '{print $0}'`
ram_total=`free -m | awk 'NR==2 {printf "%.3f", $2/1024}'`
ram_used=`free -m | awk 'NR==2 {printf "%.3f", $3/1024}'`
ram_free=`free -m | awk 'NR==2 {printf "%.3f", $4/1024}'`
space_root=`df --output=size / | tail -n 1 | awk '{printf "%.2f", $1/1024}'`
space_root_used=`df --output=used / | tail -n 1 | awk '{printf "%.2f", $1/1024}'`
space_root_free=`df --output=avail / | tail -n 1 | awk '{printf "%.2f", $1/1024}'`

