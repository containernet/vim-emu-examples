#!/bin/bash
set -e

target_repo=${1-mpeuster}

docker build -t $target_repo/vimemu-vnf-fw-ovs -f vimemu-vnf-fw-ovs/Dockerfile vimemu-vnf-fw-ovs
docker build -t $target_repo/vimemu-vnf-ids-snort -f vimemu-vnf-ids-snort/Dockerfile vimemu-vnf-ids-snort
