#! /bin/bash
ping -q -w 1 -c 1 google.com > /dev/null && echo "internet ok" || exit
cd /home/tajo48
git config --global credential.helper store
git config --global user.email 'tajo161626@gmail.com'
git config --global user.name 'tajo48'

if test -f "/home/tajo48/.ssh/id_rsa.pub"; then
    rm -rf /home/tajo48/.ssh
fi

ssh-keygen -t rsa -f ~/.ssh/id_rsa -b 4096 -C “tajo161626@gmail.com” -q -N "" -P ""
cat /home/tajo48/.ssh/id_rsa.pub | xclip
cat /home/tajo48/.ssh/id_rsa.pub
