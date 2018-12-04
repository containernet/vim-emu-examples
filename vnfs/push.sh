#!/bin/bash

set -e

target_repo=${1-mpeuster}

docker push $target_repo/vimemu-vnf-fw-ovs
docker push $target_repo/vimemu-vnf-ids-snort

