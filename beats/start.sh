#!/bin/bash -e

/var/opt/script/generate_logs.sh &
/usr/share/filebeat/filebeat &
wait
