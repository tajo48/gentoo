#! /bin/bash
cd ~/
ping -q -w 1 -c 1 google.com > /dev/null && echo "internet ok" || exit
curl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts > ~/hosts
curl https://raw.githubusercontent.com/kboghdady/youTube_ads_4_pi-hole/master/black.list | sed 's/^/0.0.0.0 /' >> ~/hosts
sudo rm -rf /etc/hosts
sudo mv ~/hosts /etc/hosts
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
