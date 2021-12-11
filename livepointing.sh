#!/bin/bash

#Read in arguments
obslat=$1
obslon=$2


while true
do
  echo "Running at:$(date -u -Iseconds)"
  fits2azel.sh $1 $2 $(ls *.fits | tail -n2 | head -n1)
  sleep 3
done
