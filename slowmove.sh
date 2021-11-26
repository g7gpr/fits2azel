#!/bin/bash
#This script moves .fits files from current directory into a test directory to simulate population by RMS
while [ $(ls *.fits | wc -l) -gt 1 ]
do
 mv $(ls *.fits | head -n1) ../test/
 sleep 10
done 

