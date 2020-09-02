#!/bin/sh

lynis audit system 2>&1 >> /tmp/lynis.system_scan.log
