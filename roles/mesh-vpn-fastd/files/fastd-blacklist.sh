#!/bin/bash

PEER_KEY=$1

if /bin/grep -Fq $PEER_KEY /etc/fastd/fastd-blacklist.json /etc/fastd/ffdo-blacklist.txt; then
  exit 1
else
  exit 0
fi