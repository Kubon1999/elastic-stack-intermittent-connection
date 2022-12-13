#!/bin/env bash

docker rmi -f devicebeats:latest
docker build . -t devicebeats:latest
