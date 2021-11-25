#!/bin/bash

#Read in arguments
obslat=$1
obslon=$2
fitsfile=$3

#Use given fitsfile, or pick latest
if [ "$fitsfile" == "" ]; then 
echo "No fits file given"
fitsfile=$(ls *.fits | tail -n1)
echo "Using $fitsfile"
fi

#Handle file not found
if [ ! -f $fitsfile ]; then
    echo "$fitsfile not found. Aborting."
    exit 1
fi


#Make working directory
mkdir $fitsfile.tmp

#Convert fits into a jpg
vips im_copy $fitsfile $fitsfile.jpg
mv $fitsfile.jpg $fitsfile.tmp

#Change into our working directory
cd $fitsfile.tmp

#Find a radec and write to ouputfile
solve-field $fitsfile.jpg -d50 --no-plots -u arcsecperpix -L 50 -H 250 --overwrite |  grep "Field center: (RA,Dec)"  | cut -d'(' -f3 | cut -d')' -f1 > $fitsfile.radec.output
imagefile=$fitsfile

#Extract ra and dec
ra=$(more $fitsfile.radec.output | cut -d',' -f1)
dec=$(more $fitsfile.radec.output | cut -d',' -f2)


#Get the time of the observation by string cutting
obsyear=${fitsfile:10:4}
obsmonth=${fitsfile:14:2}
obsdate=${fitsfile:16:2}
obshour=${fitsfile:19:2}
obsminute=${fitsfile:21:2}
obssecond=${fitsfile:23:2}
obstime=$obsyear-$obsmonth-$obsdate"T"$obshour:$obsminute:$obssecond


#For debugging
#echo "Arguments: lat, lon, ra, dec, time:" $obslat $obslon $ra $dec $obstime

#Call a function which will print out the Az and El
python3 /usr/local/bin/fits2azel.py $obslat $obslon $ra $dec $obstime

#Clean up our working directory
rm * 
cd ..

#Remove working directory
rmdir $fitsfile.tmp
exit 0
