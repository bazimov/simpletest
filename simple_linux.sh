#!/bin/bash

# This sets up test environment for an Admin. Below questions are Tier 1 simple questions. 

# Question 1: Create a user named "student" (password: student123) and give full sudo privileges as root.

userdel -r student 2>/dev/null
grep -v "student" /etc/sudoers > /etc/sudoers.bak
cat /etc/sudoers.bak > /etc/sudoers 

# Question 2: Create a group called "work" and add user student to the group.

groupdel work 2>/dev/null

# Question 3: Remove the directory called "testing1" in the /opt directory.
 
if [ -d /opt/testing1/ ]; then
   chattr -i -R /opt/testing1/
   rm -rf /opt/testing1/
fi

mkdir -p /opt/testing1/dir4/

touch /opt/testing1/dir4/removeme.txt

chattr -R +i /opt/testing1/

# Question 4: Change the ownership of the directory called "project1" in the /opt directory to the user "student", including all the files inside the project directory.

if [ -d /opt/project1/ ]; then 
 rm -rf /opt/project1/
fi

mkdir -p /opt/project1

touch /opt/project1/worknotes{1..250}.txt

# Question 5: Get the following system information of the system and save the output to the file named sysinfo.txt in the /opt directory.

#     * Current date and time

#     * System uptime

#     * Memory utilization

#     * Total count of processes running in the system

#     * Current disk utilization

if [ -f /opt/sysinfo.txt ]; then
 rm -f /opt/sysinfo.txt
fi

# Question 6: Create softlink for /opt/project2/home/test.com/command.sh as /usr/bin/testcommand.

if [ -d /opt/project2/ ]; then
 rm -rf /opt/project2/
 unlink /usr/bin/testcommand 2>/dev/null
fi

mkdir -p /opt/project2/home/test.com/

echo "printf test" > /opt/project2/home/test.com/command.sh

# Question 7: Create a cronjob for the user student. Job needs to run every 55th minute of the hour, and job needs to get the uptime of the system and append the output to the file named "uptime_by_hour.txt" in the /opt directory. (hint: use crontab)

cat /dev/null > /var/spool/cron/student
if [ -f /opt/uptime_by_hour.txt ]; then
 rm -f /opt/uptime_by_hour.txt
fi

# Question 8: Install package named "tmux" with "YUM".

yum remove tmux -y > /dev/null 2>&1

# Question 9: Find the current release of the Linux distrubition of the system and kernel version running, save the output to the file called "lsd_info.txt" in the /opt directory.

if [ -f /opt/lsd_info.txt ]; then
 rm -f /opt/lsd_info.txt
fi

# Question 10: Find (resolve) the IP address of the google.com and linux.com, save the output to the file called "resolve.txt" in the /opt directory.
if [ -f /opt/resolve.txt ]; then
 rm -f /opt/resolve.txt
fi 

scriptname=$(basename $0) 
sed '1,4d' $scriptname|grep "^#" > /tmp/questions.txt && cat /tmp/questions.txt |tr '#' ' '
echo 
echo "Test questions are above and saved to '/tmp/questions.txt' file."
