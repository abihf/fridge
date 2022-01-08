#!/bin/sh
echo schedutil > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor

ethtool --set-eee eth0 eee off

sysctl -w fs.file-max=500000
ulimit -n 819200

retry=30
while [ $retry -ge 0 ]; do
  wget -q -T 1 -O /dev/null http://google.com/ && break
  sleep 1
  retry=$(($retry-1))
done
