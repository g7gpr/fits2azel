#!/bin/bash

#Read in arguments
obslat=$1
obslon=$2
jpgfile=$3

#Use given fitsfile, or pick latest
if [ "$jpgfile" == "" ]; then 
echo "No jpg file given"
jpgfile=$(ls *.jpg | tail -n1)
echo "Using $jpgfile"
fi

#Handle file not found
if [ ! -f $fitsfile ]; then
    echo "$fitsfile not found. Aborting."
    exit 1
fi


#Make working directory
mkdir $jpgfile.tmp

cp $jpgfile.jpg $jpgfile.tmp

#Change into our working directory
cd $jpgfile.tmp

#Find a radec and write to ouputfile
solve-field $jpgfile.jpg -d50 --no-plots -u arcsecperpix -L 50 -H 250 --overwrite |  grep "Field center: (RA,Dec)"  | cut -d'(' -f3 | cut -d')' -f1 > $jpgfile.radec.output
imagefile=$jpgfile

#Extract ra and dec
ra=$(more $jpgfile.radec.output | cut -d',' -f1)
dec=$(more $jpgfile.radec.output | cut -d',' -f2)


obstime=$(date -Iseconds |  cut -d+ -f1)


#For debugging
echo "Arguments: lat, lon, ra, dec, time:" $obslat $obslon $ra $dec $obstime

#Call a function which will print out the Az and El
python3 /usr/local/bin/fits2azel.py $obslat $obslon $ra $dec $obstime

#Clean up our working directory
rm * 
cd ..

#Remove working directory
rmdir $jpgfile.tmp
exit 0
