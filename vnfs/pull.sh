#!/bin/bash

set -e

target_repo=${1-mpeuster}

docker pull $target_repo/vimemu-vnf-fw-ovs
docker pull $target_repo/vimemu-vnf-ids-snort

