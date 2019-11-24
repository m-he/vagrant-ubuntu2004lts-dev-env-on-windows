#!/bin/sh

sudo add-apt-repository ppa:jonathonf/vim
sudo apt install -y build-essential cmake exuberant-ctags vim vim-gtk

pip install --user git+git://github.com/powerline/powerline
git clone https://github.com/powerline/fonts.git --depth=1
./fonts/install.sh
fc-cache -vf ~/.local/share/fonts/
rm -rf ./fonts

sh -c "$(curl -fsSL https://raw.githubusercontent.com/zeroneipi/python-vimrc/master/setup.sh)"
python $HOME/.vim/bundle/YouCompleteMe/install.py