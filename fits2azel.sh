#!/bin/bash
obslat=$1
obslon=$2
fitsfile=$3
if [ "$fitsfile" == "" ]; then 
echo "No fits file given"
fitsfile=$(ls *.fits | tail -n1)
echo "Using $fitsfile"
fi
mkdir $fitsfile.tmp
vips im_copy $fitsfile $fitsfile.jpg
mv $fitsfile.jpg $fitsfile.tmp
cd $fitsfile.tmp
solve-field $fitsfile.jpg -d50 --no-plots -u arcsecperpix -L 50 -H 250 --overwrite |  grep "Field center: (RA,Dec)"  | cut -d'(' -f3 | cut -d')' -f1 > $fitsfile.radec.output
imagefile=$fitsfile
ra=$(more $fitsfile.radec.output | cut -d',' -f1)
dec=$(more $fitsfile.radec.output | cut -d',' -f2)
obsyear=${fitsfile:10:4}
obsmonth=${fitsfile:14:2}
obsdate=${fitsfile:16:2}
obshour=${fitsfile:19:2}
obsminute=${fitsfile:21:2}
obssecond=${fitsfile:23:2}
obstime=$obsyear-$obsmonth-$obsdate"T"$obshour:$obsminute:$obssecond
#echo "Arguments: lat, lon, ra, dec, time:" $obslat $obslon $ra $dec $obstime
python3 /usr/local/bin/fits2azel.py $obslat $obslon $ra $dec $obstime
rm * 
cd ..
rmdir $fitsfile.tmp
