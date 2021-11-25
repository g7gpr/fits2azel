# fits2azel

Routine to take latitude, longtitude and an RMS format fits file and return the azimuth and elevation of image.

## Example - no fits file specified 

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

## Example - fits file specified


```
./fits2azel.sh -32.007 16.134 FF_AU000H_20211124_173514_535_0550400.fits 
jpegtopnm: WRITING PGM FILE
Read file /tmp/tmp.ppm.W4Py9i: 1280 x 720 pixels x 1 color(s); maxval 255
Using 8-bit output
(Azimuth, Elevation) =  (161.03209371969726, 33.60270072565061) degrees.
```
