#!/bin/env bash

echo "Simulating network interruption"
for c in {1..100}
do 
    if [ $((c%2)) -eq 0 ]
    then
    echo "--- Turning OFF network in BEATS for 120 seconds ---"
    TIME=$(TZ='Europe/Warsaw' date)
    echo "--- TIME: ${TIME}"
    docker network disconnect elastic-stack-intermittent-connection_elk beats 
    docker inspect beats -f "{{json .NetworkSettings.Networks }}"
    sleep 120
    echo "--- Turning ON network in BEATS. ---"
    TIME=$(TZ='Europe/Warsaw' date)
    echo "--- TIME: ${TIME}"
    docker network connect elastic-stack-intermittent-connection_elk beats
    docker inspect beats -f "{{json .NetworkSettings.Networks }}"
    else
    echo "--- Turning OFF network in LOGSTASH for 120 seconds ---"
    TIME=$(TZ='Europe/Warsaw' date)
    echo "--- TIME: ${TIME}"
    docker network disconnect elastic-stack-intermittent-connection_elk logstash
    docker inspect logstash -f "{{json .NetworkSettings.Networks }}"
    sleep 120
    echo "--- Turning ON network in LOGSTASH. ---"
    TIME=$(TZ='Europe/Warsaw' date)
    echo "--- TIME: ${TIME}"
    docker network connect elastic-stack-intermittent-connection_elk logstash
    docker inspect logstash -f "{{json .NetworkSettings.Networks }}"
    fi
    sleep 120
done
