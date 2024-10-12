#!/usr/bin/env bash

#Run with sudo, or root  (for lastb)
#COLOR
G='\033[32m'
RST='\033[0m'
Y='\033[33m'
#Print kernel version, disctro, arch, and  total cores
#AND TOTAL cpu usage between ALL CORES

echo -e "${Y}SERVER PERFORMANCE${RST}\n$(date +"%m/%d/%Y" && date +"%H:%M PDT")\n"
echo -e "${G}---FAILED LOGINS---${RST}"
lastb | awk 'NR < 4'

echo -e "\n${G}---LOGGED IN---${RST}"
w -s

echo -e "\n${G}KERNEL VERSION / ARCHITECTURE${RST}\n"
mpstat | awk 'NR < 3 ($4="") '
echo -e "${G}UPTIME:${RST} $(uptime -p)\n"
echo -e "${G}----CPU----${RST}"
mpstat | awk 'NR > 3 {print "USED:"(100.0 - $13)"%"; print "FREE: "$13"%" }'

echo -e "${G}----MEM----${RST}"
free | grep Mem | awk '{mem=($3/$2 * 100); printf "USED: %.2f%\n", mem}'
free | grep Mem | awk '{free=($4/$2 * 100); printf "FREE: %.2f% (Not in Buffer/Cache/Programs)\n",free}'

#free -h | grep Mem | awk '{print "In GB: " $3; print "Free Memory: " $4}'


echo -e "\n${G}----TOP 5 PROCESSES----${RST}"
echo -e "${G}----CPU----${RST}"
ps -eo pid,user,%cpu,comm --sort=-%cpu | head -5

echo -e "${G}----MEM----${RST}"
ps -eo pid,user,%mem,comm --sort=-%mem | head -5

