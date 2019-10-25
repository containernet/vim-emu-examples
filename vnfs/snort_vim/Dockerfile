FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
	iptables \
	arptables \
	ebtables \
	ethtool \
	bridge-utils \
	build-essential \
	libpcap-dev \
	libpcre3-dev \
	libdumbnet-dev \
	bison \
	flex \
	hwloc \
	libhwloc-dev \
	libluajit-5.1 \
	libluajit-5.1-dev \
	pkg-config \
	cmake \
	openssl \
	libssl-dev \
	python \
	python-pandas \
	python-yaml \
	nano \
	tcpdump \
	net-tools \
	wget \
	python3 \
	python3-pip \
    zlib1g-dev \
    liblzma-dev \
    libssl-dev

RUN pip3 install flatten_json
RUN pip3 install prometheus_client
RUN pip3 install six

ADD ./snort/ /snort

RUN wget https://snort.org/downloads/snortplus/daq-2.2.2.tar.gz
RUN tar -xvzf daq-2.2.2.tar.gz
WORKDIR daq-2.2.2
RUN ./configure
RUN make
RUN make install
RUN ldconfig

WORKDIR /
RUN wget https://snort.org/downloads/snortplus/snort-3.0.0-beta.tar.gz
RUN tar -xvzf snort-3.0.0-beta.tar.gz
ENV snort_path=/snort-3.0.0
ENV LUA_PATH=/snort-3.0.0/include/snort/lua/\?.lua\;\;
ENV SNORT_LUA_PATH=/snort-3.0.0/etc/snort/

WORKDIR /snort-3.0.0
RUN ./configure_cmake.sh --prefix=/snort-3.0.0
WORKDIR /snort-3.0.0/build
RUN make -j 8
RUN make install
RUN ln -s /snort-3.0.0/conf /snort-3.0.0/etc
RUN ldconfig

WORKDIR /snort-3.0.0/build/src
ENV PATH /snort-3.0.0/build/src:$PATH

ADD snort/start.sh start.sh
RUN chmod +x start.sh
ADD snort/stop.sh stop.sh
RUN chmod +x stop.sh
ADD snort/restart_snort.sh restart_snort.sh
RUN chmod +x restart_snort.sh
ADD snort/stats.py stats.py
RUN chmod +x stats.py
ADD snort/log_intf_statistics.py log_intf_statistics.py

WORKDIR /

RUN wget https://www.snort.org/downloads/community/snort3-community-rules.tar.gz
RUN tar xvfz snort3-community-rules.tar.gz

WORKDIR /snort-3.0.0/build/src

ENV VIM_EMU_CMD "bash /snort/start.sh"
ENV VIM_EMU_CMD_STOP "echo 'Stop host...'"

ENV IFIN input
ENV IFOUT output

RUN mkdir /var/log/snort

CMD /bin/bash
