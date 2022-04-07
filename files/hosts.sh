#! /bin/bash
cd ~/
ping -q -w 1 -c 1 google.com > /dev/null && echo "internet ok" || exit
curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts > ~/hosts
echo -e "0.0.0.0 www.youtube.com\n0.0.0.0 music.youtube.com" >> ~/hosts
sudo rm -rf /etc/hosts
sudo mv ~/hosts /etc/hosts
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

