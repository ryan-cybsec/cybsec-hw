#!/bin/sh

lynis audit malware authentication networking storage filesystems 2>&1 >> /tmp/lynis.partial_scan.log
