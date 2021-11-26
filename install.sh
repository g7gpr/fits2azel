git clone https://github.com/geospace-code/pymap3d
pip install -e pymap3d
sudo apt-get install astrometry.net -y
sudo apt-get install libvips-dev -y
sudo rm /usr/share/astrometry/*
sudo wget http://data.astrometry.net/4100/index-4107.fits -P /usr/share/astrometry/
sudo wget http://data.astrometry.net/4100/index-4108.fits -P /usr/share/astrometry/
sudo wget http://data.astrometry.net/4100/index-4109.fits -P /usr/share/astrometry/
sudo wget http://data.astrometry.net/4100/index-4110.fits -P /usr/share/astrometry/
sudo wget http://data.astrometry.net/4100/index-4111.fits -P /usr/share/astrometry/
sudo wget http://data.astrometry.net/4100/index-4112.fits -P /usr/share/astrometry/
sudo wget http://data.astrometry.net/4100/index-4113.fits -P /usr/share/astrometry/
sudo wget http://data.astrometry.net/4100/index-4114.fits -P /usr/share/astrometry/
sudo wget http://data.astrometry.net/4100/index-4115.fits -P /usr/share/astrometry/
sudo wget http://data.astrometry.net/4100/index-4116.fits -P /usr/share/astrometry/
sudo wget http://data.astrometry.net/4100/index-4117.fits -P /usr/share/astrometry/
sudo wget http://data.astrometry.net/4100/index-4118.fits -P /usr/share/astrometry/
sudo cp fits2azel.sh    /usr/local/bin
sudo cp fits2azel.py    /usr/local/bin
sudo cp livepointing.sh /usr/local/bin
