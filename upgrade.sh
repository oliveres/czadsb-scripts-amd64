#!/bin/sh


file_version=1.0.3


file="/boot/installed"

# if ! grep -q $file_version "$file"; then
  echo "Upgrade running"

  cd ~/czadsb-scripts/upgrade
  sudo chmod +x mlat-upgrade.sh
  ./mlat-upgrade.sh
  echo "Upgrade finished"
  sudo echo $file_version | sudo tee -a $file
# fi
