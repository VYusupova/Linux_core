#!/bin/bash

hostname=$HOSTNAME
timezone=$(timedatectl | grep 'Time zone' | awk '{print $3, $4, $5}');
user=$USER
system_os=$(sed 's/ \\.*$//' /etc/issue)
date=`date | awk '{print $2, $3, $4, $5}'`
uptime=`uptime -p | awk '{print $2, $3, $4, $5}'`
uptime_sec=`cat /proc/uptime | awk  '{print $2}'`
ip=`ip -o -f inet addr show |  sed -n '2'p | awk  '{print $4}' | cut -d/ -f1` 
mask_tmp=`ip -o -f inet addr show | awk  '{print $4}' | cut -d/ -f2`
mask=`ipcalc -b 0.0.0.0/$mask_tmp | sed -n '2'p | awk '{print $2}'`
gateway=`ip route show default | head -n 1 | awk '{print $3}'`
ram_total=`free -m | awk 'NR==2 {printf "%.3f GB", $2/1024}'`
ram_used=`free -m | awk 'NR==2 {printf "%.3f GB", $3/1024}'`
ram_free=`free -m | awk 'NR==2 {printf "%.3f GB", $4/1024}'`
space_root=`df --output=size / | tail -n 1 | awk '{printf "%.2f MB", $1/1024}'`
space_root_used=`df --output=used / | tail -n 1 | awk '{printf "%.2f MB", $1/1024}'`
space_root_free=`df --output=avail / | tail -n 1 | awk '{printf "%.2f MB", $1/1024}'`

ARR_PARAM=("HOSTNAME" 
"TIMEZONE" 
"USER" 
"OS" 
"DATE" 
"UPTIME" 
"UPTIME_SEC"
"IP" 
"MASK" 
"GETAWAY"
"RAM_TOTAL"
"RAM_USED" 
"RAM_FREE" 
"SPACE_ROOT" 
"SPACE_ROOT_USED"
"SPACE_ROOT_FREE"
)

VAL_PARAM=("$hostname"
"$timezone"
"$user"
"$system_os"
"$date"
"$uptime"
"$uptime_sec"
"$ip"
"$mask"
"$gateway"
"$ram_total"
"$ram_used"
"$ram_free"
"$space_root"
"$space_root_used"
"$space_root_free"
)
