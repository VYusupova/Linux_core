hostname
timedatectl | grep "Time zone"
whoami
cat /etc/issue
date
uptime -p
cat  /proc/uptime | awk '{print 1}'
echo "IP = "`ip a | grep 'inet '`  #(any of the obtained addresses will do)
 /sbin/ifconfig | grep netmask #(any of the obtained masks will do)
ip -4 route show default
grep MemTotal /proc/meminfo
vmstat -s | grep 'used m'
grep MemFree /proc/meminfo
df -hT | grep '/|Filesystem'
