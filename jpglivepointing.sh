#!/bin/bash

#Read in arguments
obslat=$1
obslon=$2


while true
do
  echo "Running at:$(date -u -Iseconds)"
  jpg2azel.sh  $1 $2 live
  sleep 3
done
