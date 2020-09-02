#!/bin/bash

echo "== $(date) =="
date
uname
ip addr | grep "inet.*wlp4s0" | awk '{ print $2 }'
