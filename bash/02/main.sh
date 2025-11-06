#!/bin/bash

source info_system.sh

if [ -n "$1" ];
then 
echo "Not enter parametr"
exit 1
fi 
show_system_info="HOSTNAME = $hostname 
TIMEZONE = $timezone
USER = $user
OS = $system_os
DATE = $date
UPTIME = $uptime
UPTIME_SEC = $uptime_sec
IP = $ip
MASK = $mask
GETAWAY = $gateway
RAM_TOTAL = $ram_total
RAM_USED = $ram_used
RAM_FREE = $ram_free
SPACE_ROOT = $space_root
SPACE_ROOT_USED = $space_root_used
SPACE_ROOT_FREE = $space_root_free"

echo "$show_system_info"

read -p $'\nDo you want to save this data to a file?\n' res
if [[ $res == "Y" || $res == "y" ]]
then
    file=$(date '+%d_%m_%y_%H_%M_%S').status;
    echo "$show_system_info" > $file;
    echo -e "Info save to file \"$file\"";
fi;

exit 0;
