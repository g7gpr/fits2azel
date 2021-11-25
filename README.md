#fits2azel

Routine to take latitude, longtitude and an RMS format fits file and return the azimuth and elevation of image.

#Example 

In this case no fits file is specified, the newest file in the directory is used.

```
./fits2azel.sh -32.007 16.134
No fits file given
Using FF_AU000E_20211124_141146_161_0243456.fits
jpegtopnm: WRITING PGM FILE
Read file /tmp/tmp.ppm.7gwcy8: 1280 x 720 pixels x 1 color(s); maxval 255
Using 8-bit output
(Azimuth, Elevation) =  (115.49715595241177, -36.10926202143634) degrees.
``` 

