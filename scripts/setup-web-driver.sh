#!/bin/sh

wget -O geckodriver.tar.gz  https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz
sudo tar -xvzf geckodriver.tar.gz -C /usr/local/bin/
rm geckodriver.tar.gz

sudo apt install -y dbus-x11 libasound2 libx11-xcb1 ttf-wqy-microhei ttf-wqy-zenhei  firefox
