#!/bin/bash
# $1 - path to snort 5GTANGO service package
echo $1
curl -i -X POST -F package=@$1 http://127.0.0.1:5000/packages
curl -i -X POST http://127.0.0.1:5000/instantiations -d "{}"
vim-emu compute start -d dc1 -n client -i iperf_vim_client:latest
vim-emu compute start -d dc1 -n server -i iperf_vim_server:latest
vim-emu compute list
vim-emu network add -b -src client:emu0 -dst vnf0.vdu01.0:input
vim-emu network add -b -src vnf0.vdu01.0:output -dst server:emu0
