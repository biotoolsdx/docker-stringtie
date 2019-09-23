FROM ubuntu:16.04
MAINTAINER Chen Yuelong <yuelong.chen.btr@gmail.com>

ARG version=2.0.3
RUN mkdir -p /opt/tools

WORKDIR /opt/tools

# install stringtie
RUN \
  apt update && apt install -y wget && \
  wget -c http://ccb.jhu.edu/software/stringtie/dl/stringtie-${version}.Linux_x86_64.tar.gz && \
  tar -zxvf stringtie-${version}.Linux_x86_64.tar.gz && \
  cp stringtie-${version}.Linux_x86_64/stringtie /usr/local/bin && \
  rm -rf stringtie* && \
  apt-get remove --purge --yes \
              wget && \
  apt-get autoremove --purge --yes && \
  apt-get clean


CMD stringtie -h