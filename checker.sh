#!/bin/bash

# This script checks 

echo "Answer for question 1: " 
id student
if [ $? -eq 0 ]; then echo "User student exists. OK"
else echo "Fail!"
fi 
echo
echo "Answer for question 2: "
grep work /etc/gshadow
if [ $(grep work /etc/gshadow|wc -l) -eq 0 ]; then echo "Group not found! Fail!"
else echo "PASS!"
fi
echo
echo "Answer for question 3: "
if [ ! -d /opt/testing1/ ]; then
 echo "Directory testing1 has been deleted: PASS!"
else
 echo "Directory still exists: Fail!"
fi 
echo
echo "Answer for question 4: "
ls -l /opt/ |grep project1|grep student && ls -l /opt/project1/ |grep student > /tmp/check4.txt
if [ $(wc -l /tmp/check4.txt|awk '{print $1}') -ge 250 ]; then echo "Pass!"
else echo "Fail!" 
fi
echo
echo "Answer for question 5: "
if [ ! -f /opt/sysinfo.txt ]; then echo "Fail!"; fi
cat /opt/sysinfo.txt
echo
echo "Answer for question 6: "
if [ -L /usr/bin/testcommand ]; then echo "PASS!"
else echo "No softlink found. Fail!"
fi
echo 
echo "Answer for question 7: "
cat /var/spool/cron/student
if [ $(wc -l /var/spool/cron/student|awk '{print $1}') -eq 0 ]; then echo "Fail!"
else echo "Cron exists, OK."
fi
echo 
echo "Answer for question 8: "
rpm -qi tmux 
if [ $? -eq 0 ]; then echo "PASS!"
else echo "Fail!"
fi
echo
echo "Answer for question 9: "
cat /opt/lsd_info.txt
if [ $? -eq 0 ]; then echo "File exists! OK."
else echo "Fail!"
fi
echo 
echo "Answer for question 10: "
cat /opt/resolve.txt
if [ $? -eq 0 ]; then echo "File exists! OK."
else echo "Fail!"
fi

