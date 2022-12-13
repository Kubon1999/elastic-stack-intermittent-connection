#!/bin/bash -e

/var/opt/logs/generate_logs.sh &
/usr/share/filebeat/filebeat &
wait
