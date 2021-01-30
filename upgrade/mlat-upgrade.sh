
echo "Ukoncuji mlat klienta (pokud bezi)"
sudo killall  mlat-client
echo "Cistim logy"
sudo rm -rf /var/log
cd ~
echo "Odstranuji stareho mlat klienta"
sudo rm -rf mlat-client
echo "Stahuji noveho klienta"
git clone https://github.com/mutability/mlat-client.git
cd mlat-client
git checkout v0.2.11

. /etc/os-release
if [ "$VERSION_ID" = "20.04" ]; then
    echo "Pouzivate Raspbian Buster, aplikuji upravu nutnou pro spravny bez klienta"
    sudo apt-get install  tcl8.6-dev autoconf python3-venv dh-systemd libz-dev -y
    wget 'https://github.com/anthony-tuininga/cx_Freeze/archive/6.0.tar.gz'
    tar -xvf 6.0.tar.gz
    cd cx_Freeze-6.0
    python3 setup.py build
    sudo python3 setup.py install
    cd ~/mlat-client
fi

username="$(id -u -n)"
sudo chown $username:$username ~/mlat-client

echo "Zahajuji instalaci"
sudo ./setup.py install

echo "Updatuji mlat startovaci skript"
sudo rm ~/mlat-client/czadsb.mlat-client.sh
sudo cp ~/czadsb-scripts/starters/czadsb.mlat-client.sh ~/mlat-client/czadsb.mlat-client.sh
sudo chmod +x ~/mlat-client/czadsb.mlat-client.sh
sudo chown $username:$username ~/mlat-client/czadsb.mlat-client.sh

echo "Hotovo"
