#!/bin/bash 

while true; do
  TYPE=$(($RANDOM % 4))
  TIME=$(date)
  case "$TYPE" in
    "0") echo "${TIME} [DEBUG] Device is working somehow." >> device.log ;;
    "1") echo "${TIME} [ERROR] Device is not working." >> device.log ;;
    "2") echo "${TIME} [OK]    Device is working properly." >> device.log ;;
    "3") echo "${TIME} [INFO]  Device is going through changes." >> device.log ;;
  esac
  
  sleep 1
done

