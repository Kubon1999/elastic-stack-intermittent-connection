echo "Simulating network interruption"
TIME=$(TZ='Europe/Warsaw' date)
for (( c=1; c<=100; c++ ))
do 
    if [ $((c%2)) -eq 0 ]
    then
    echo "--- Turning OFF network in BEATS for 5 seconds ---"
    echo "--- TIME: ${TIME}"
    docker network disconnect elk_elk beats 
    docker inspect beats -f "{{json .NetworkSettings.Networks }}"
    sleep 5
    echo "--- Turning ON network in BEATS. ---"
    echo "--- TIME: ${TIME}"
    docker network connect elk_elk beats
    docker inspect beats -f "{{json .NetworkSettings.Networks }}"
    else
    echo "--- Turning OFF network in LOGSTASH for 5 seconds ---"
    echo "--- TIME: ${TIME}"
    docker network disconnect elk_elk logstash
    docker inspect logstash -f "{{json .NetworkSettings.Networks }}"
    sleep 5
    echo "--- Turning ON network in LOGSTASH. ---"
    echo "--- TIME: ${TIME}"
    docker network connect elk_elk logstash
    docker inspect logstash -f "{{json .NetworkSettings.Networks }}"
    fi
    sleep 1
done