#!/bin/sh

num=`lscpu | grep -n "^CPU(s):" | awk '{print $2}'`
echo "cpu num: $num"
num=`free -g | grep  "Mem:" | awk '{print $2}'`  #-g 表示用G表示内存 -m 用m表示
echo "memory total: ${num}G"
num=`free -m | grep  "Mem:" | awk '{print $4}'`
echo "memory free: ${num}G"

num=`df -h / | grep -n "/$" | awk '{print $2}'` #-h 表示用g表示内存 -m -k同理
echo "disk size: ${num}G"

num=`getconf LONG_BIT`
echo "system bit: ${num}"

num=`ps aux | grep -c ""`
echo "process: ${num}"

num=`dpkg -l | grep -c ""`
echo "software num: ${num}"

num=`ifconfig | sed -n '2p' | awk '{print $2}' | awk -F ':' '{print $2}'`
echo "ip: ${num:5}"