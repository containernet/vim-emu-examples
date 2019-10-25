#!/bin/bash
pkill snort
sleep 1

# run snort as background process (snort3)
./snort -i br0 -k none -l /var/log/snort > /var/log/snort/snort_output.log 2>&1 &

echo "Snort VNF started ..."
