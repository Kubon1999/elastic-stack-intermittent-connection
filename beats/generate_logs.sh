#!/bin/bash 

while true; do
  TYPE=$(($RANDOM % 4))
  TIME=$(TZ='Europe/Warsaw' date)
  case "$TYPE" in
    "0") echo "${TIME} [DEBUG] Device is working somehow." >> /var/opt/logs/device.log ;;
    "1") echo "${TIME} [ERROR] Device is not working." >> /var/opt/logs/device.log ;;
    "2") echo "${TIME} [OK]    Device is working properly." >> /var/opt/logs/device.log ;;
    "3") echo "${TIME} [INFO]  Device is going through changes." >> /var/opt/logs/device.log ;;
  esac
  
  sleep 1
done

