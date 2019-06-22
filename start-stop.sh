#!/bin/bash
if [ "$1" == "start" ] 
then
    docker-compose up -d
else
    docker-compose down
fi