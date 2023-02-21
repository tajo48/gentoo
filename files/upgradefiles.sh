#!/bin/bash
ping -q -w 1 -c 1 startpage.com > /dev/null && echo "internet ok" || exit
cd /home/tajo48/
mkdir -p /home/tajo48/ /home/tajo48/ARCH/
touch /home/tajo48/.xinitrc /home/tajo48/.zshrc
sudo rm -r /home/tajo48/ARCH





rm -rf /home/tajo48/ARCH
if test -f "/home/tajo48/.ssh/id_rsa.pub"; then
    echo "ssh key exists"
    touch /home/tajo48/.ssh/known_hosts
    ssh-keygen -F github.com || ssh-keyscan github.com > /home/tajo48/.ssh/known_hosts
    git clone git@github.com:tajo48/ARCH.git
else
    echo "ssh key not found"
    git clone https://github.com/tajo48/ARCH.git
fi

rm -rf /home/tajo48/.xinitrc /home/tajo48/.zshrc
cp /home/tajo48/ARCH/files/xinitrc /home/tajo48/.xinitrc
cp /home/tajo48/ARCH/files/zshrc /home/tajo48/.zshrc
cp /home/tajo48/ARCH/files/dap.lua /home/tajo48/.config/nvim/lua/configs/dap.lua

if [ -f "/home/tajo48/Git/ARCH/install.sh" ]; then
    cd /home/tajo48/Git/ARCH
    
    if test -f "/home/tajo48/.ssh/id_rsa.pub"; then
        echo "ssh key exists"
        if git diff --quiet; then
            echo "no changes"
            cd /home/tajo48/Git/
            rm -rf /home/tajo48/Git/ARCH
            git clone git@github.com:tajo48/ARCH.git
        else
            echo "changes found"
        fi
    else
        echo "ssh key not found"
        cd /home/tajo48/Git/
        rm -rf /home/tajo48/Git/ARCH
        git clone https://github.com/tajo48/ARCH.git
    fi
    
    # if git diff | w is not empty, then exit
    
else
    cd /home/tajo48/Git
    if test -f "/home/tajo48/.ssh/id_rsa.pub"; then
        echo "ssh key exists"
        git clone git@github.com:tajo48/ARCH.git
    else
        echo "ssh key not found"
        git clone https://github.com/tajo48/ARCH.git
    fi
    
fi

if [ -d "$HOME/.config/nvim" ]; then
    echo "Nvim Installed"
else
rm -rf ~/.config/nvim
rm -rf ~/.cache/nvim
rm -rf ~/.local/share/nvim
git clone https://github.com/AstroNvim/AstroNvim /home/tajo48/.config/nvim
cp /home/tajo48/ARCH/files/dap.lua /home/tajo48/.config/nvim/lua/configs/dap.lua
sed -i 's/-- Optimiser/-- nvim-discord\n  ["andweeb\/presence.nvim"] = {},\n\n  -- Optimiser/g' /home/tajo48/.config/nvim/lua/core/plugins.lua
git clone https://github.com/github/copilot.vim.git /home/tajo48/.config/nvim/pack/github/start/copilot.vim
fi

rm -rf /home/tajo48/ARCH/.git
