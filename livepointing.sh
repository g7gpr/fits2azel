#!/bin/bash

#Read in arguments
obslat=$1
obslon=$2


while true
do
  fits2azel.sh $1 $2 $(ls *.fits | tail -n1)
  sleep 10
done