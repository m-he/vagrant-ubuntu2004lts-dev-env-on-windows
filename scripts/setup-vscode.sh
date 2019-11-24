#!/bin/sh

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt update
sudo apt install -y dbus-x11 libasound2 libx11-xcb1 code

code --install-extension ms-python.python
code --install-extension njpwerner.autodocstring