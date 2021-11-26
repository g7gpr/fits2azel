# fits2azel

Routine to take latitude, longtitude and an RMS format fits file and return the azimuth and elevation of image.

## Installation

```
sudo apt-get install git -y
git clone https://github.com/g7gpr/fits2azel
cd fits2azel
sudo ./install.sh
```


## Example - no fits file specified 

In this case no fits file is specified, the newest file in the directory is used.

```
fits2azel.sh -32.007 16.134
No fits file given
Using FF_AU000E_20211124_141146_161_0243456.fits
jpegtopnm: WRITING PGM FILE
Read file /tmp/tmp.ppm.7gwcy8: 1280 x 720 pixels x 1 color(s); maxval 255
Using 8-bit output
(Azimuth, Elevation) =  (115.49715595241177, -36.10926202143634) degrees.
``` 

## Example - fits file specified


```
fits2azel.sh -32.007 16.134 FF_AU000H_20211124_173514_535_0550400.fits 
jpegtopnm: WRITING PGM FILE
Read file /tmp/tmp.ppm.W4Py9i: 1280 x 720 pixels x 1 color(s); maxval 255
Using 8-bit output
(Azimuth, Elevation) =  (161.03209371969726, 33.60270072565061) degrees.
```

## Example - fits file specified

```
fits2azel.sh -32.3 115.8 FF_AU0006_20211119_194320_490_0746752.fits
jpegtopnm: WRITING PGM FILE
Read file /tmp/tmp.ppm.JzJKW6: 1280 x 720 pixels x 1 color(s); maxval 255
Using 8-bit output
(Azimuth, Elevation) =  (35.29419530240298, 76.4880184876137) degrees.
```


## Example - non existent file specified

```
fits2azel.sh -35 116 FF_AUZZZZ_20211119_194320_490_0746752.fits
FF_AUZZZZ_20211119_194320_490_0746752.fits not found. Aborting
```

## Example - live pointing

This function is intended to assist with pointing a camera to a defined Azimuth and Elevation. Given the local lat and lon it will take the latest FITS file in the directory in which it is running and print the azimuth and elevation.

```
./livepointing.sh -36 116
Running at:2021-11-25T23:06:52+00:00
jpegtopnm: WRITING PGM FILE
Read file /tmp/tmp.ppm.HESUFk: 1280 x 720 pixels x 1 color(s); maxval 255
Using 8-bit output
(Azimuth, Elevation) =  (188.8454784103749, 50.679447876699776) degrees.
```
