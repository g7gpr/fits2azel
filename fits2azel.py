from astropy.coordinates import EarthLocation,SkyCoord
from astropy.time import Time
from astropy import units as u
from astropy.coordinates import AltAz
import pymap3d as pm
from datetime import datetime

import subprocess
import sys

#Read in the argumenst
lat=float(sys.argv[1])
lon=float(sys.argv[2])
ra=float(sys.argv[3])
dec=float(sys.argv[4])
obstime=(sys.argv[5])

#Print out the Azimuth and Elevation
print("(Azimuth, Elevation) = ",(pm.radec2azel(int(ra),int(dec),lat,lon,obstime)),"degrees.")

