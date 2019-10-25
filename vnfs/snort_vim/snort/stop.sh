#! /bin/bash

# pkill snort
kill -SIGINT `ps -ef | grep snort | head -n 1 | awk '{print $2}'` 2> /dev/null
pkill snort

sleep 4

# process snort.stats and create result.yml
python stats.py /var/log/snort/result.yml
python log_intf_statistics.py /var/log/snort/result.yml

date > /var/log/snort/stop.txt
