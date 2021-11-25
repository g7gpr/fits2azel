from astropy.coordinates import EarthLocation,SkyCoord
from astropy.time import Time
from astropy import units as u
from astropy.coordinates import AltAz
from pymap3d import *
from datetime import datetime
import subprocess
import sys
lat=float(sys.argv[1])
lon=float(sys.argv[2])
ra=float(sys.argv[3])
dec=float(sys.argv[4])
obstime=(sys.argv[5])
print("(Azimuth, Elevation) = ",(radec2azel(int(ra),int(dec),lat,lon,obstime)),"degrees.")

