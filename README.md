# czadsb-scripts for Ubuntu 20.04.1 (amd64)

Instalační skript pro CZADSB od Pavla Koníře, který je upravený tak, aby fungoval na architektuře amd64, tedy aby bylo možné ho instalovat na virtuální/fyzický server, pokud nepoužíváte RPi či jiné jednodeskové mikropočítače. PiAware není instalován.

```
bash -c "$(wget -O - https://raw.githubusercontent.com/oliveres/czadsb-scripts/master/czadsb-install.sh)"
```
Pokud použijete virtualizaci, je pravděpodobné, že budete muset přepojit celý USB controller pomocí PCI passthrough do virtuálního serveru, jinak bude blbnout MLAT synchronizace. Nelze použít jen USB passthrough.

Doporučená virtualizace je XCP-ng. Postup pak zde: https://xcp-ng.org/docs/compute.html#pci-passthrough
Pokud se vám v rámci tohoto návodu nebude dařit vypsat xl pci-assignable-list, tak to nevadí, mě to šlo ikdyž nic nevypsalo. Důležité neudělat chybu v čísle toho PCI zařízení - pozor na dvojtečky, jsou tam dvoje a jedna tečka. Nuly jsou doplněny z levé strany.
