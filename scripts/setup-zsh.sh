#!/bin/bash
sudo apt install -y zsh tmux sqlite3
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/larkery/zsh-histdb ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-histdb
wget https://raw.githubusercontent.com/zeroneipi/zshrc/master/.zshrc -O ~/.zshrc