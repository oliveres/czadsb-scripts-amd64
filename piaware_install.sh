#!/bin/sh

# Add piaware source
wget http://flightaware.com/adsb/piaware/files/packages/pool/piaware/p/piaware-support/piaware-repository_3.5.1_all.deb
sudo dpkg -i piaware-repository_3.5.1_all.deb

#Install piaware
sudo apt-get update
sudo apt-get install piaware piaware-web dump1090-fa -y

