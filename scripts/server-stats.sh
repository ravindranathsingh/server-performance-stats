#!/bin/bash

set -euo pipefail

source ./color.sh

#Total CPU Usage
cpu_usage() {
    echo -e "${Y}++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    echo "++++++++++++++++++ Total CPU Usage +++++++++++++++++++"
    echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++${NC}"
    echo
    printf "CPU Usage is:" 
    top -bn1 | awk '/Cpu\(s\)/ {print 100 - $8 "%"}'
}

#Total Memory Usage
memory_usage() {
    echo -e "${Y}+++++++++++++++++++++++++++++++++++++++++++++++++++++"
    echo "+++++++++++++++ Total Memory Usage ++++++++++++++++++"
    echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++++${NC}"
    echo
    free -m | awk '/^Mem:/ {
      used=$3/$2*100
      free=$4/$2*100
      avail=$7/$2*100
      printf "Total Memory     : %.2f GB\n", $2/1024
      printf "Used Memory      : %.2f GB (%.2f%%)\n", $3/1024, used
      printf "Free Memory      : %.2f GB (%.2f%%)\n", $4/1024, free
      printf "Available Memory : %.2f GB (%.2f%%)\n", $7/1024, avail
    }'
}

#Disk Usage
disk_usage() {
    echo -e "${Y}+++++++++++++++++++++++++++++++++++++++++++++++++++++"
    echo "+++++++++++++++++ Total Disk Usage ++++++++++++++++++"
    echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++++${NC}"
    echo
    df -h / | awk 'NR==2 {
      print "Total Disk  : ", $2
      print "Used Disk   : ", $3 "(" $5 ")"
      print "Free Disk   : ", $4 "(" 100 - $5 "%)"
    }'
}

#Top process by CPU Usage
top_cpu_process() {
    echo -e "${Y}+++++++++++++++++++++++++++++++++++++++++++++++++++++"
    echo "++++++++++ Top 5 process by CPU Usage +++++++++++++++"
    echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++++${NC}"
    echo
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
}

#Top process by Memory Usage
top_memory_process() {
    echo -e "${Y}+++++++++++++++++++++++++++++++++++++++++++++++++++++"
    echo "++++++++++++ Top 5 process by Memory Usage ++++++++++"
    echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++++${NC}"
    echo
    ps -eo pid,comm,%mem --sort=-%mem | head -n 6
}

main() {
    echo -e "${G}+++++++++++++++++++++++++++++++++++++++++++++++++++++"
    echo "+++++++++++++++++ Server Stats ++++++++++++++++++++++"
    echo -e "+++++++++++++++++++++++++++++++++++++++++++++++++++++${NC}"
    echo -e "${B}1. CPU Usage"
    echo "2. Memory Usage"
    echo "3. Disk Usage"
    echo "4. Top Process By CPU Usage"
    echo "5. Top Process by Memory Usage"
    echo -e "6. All Stats${NC}"

    read -p "Choose an option:" choice
    case "$choice" in
        1) cpu_usage;;
        2) memory_usage;;
        3) disk_usage;;
        4) top_cpu_process;;
        5) top_memory_process;;
        6)
           cpu_usage
           echo
           memory_usage
           echo
           disk_usage
           echo
           top_cpu_process
           echo
           top_memory_process
           ;;
        *) echo -e "${R}Invalid Option!${NC}"
           exit 1;;
    esac
}
main
