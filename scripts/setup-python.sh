#!/bin/sh

add-apt-repository -y ppa:deadsnakes/ppa
apt update
apt remove -y python3-distutils
apt install -y python3.8 python3.8-dev python3.8-distutils python3-setuptools 
ln -sfn /usr/bin/python3.8 /usr/bin/python
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
rm get-pip.py
pip install virtualenv yapf pylint ipdb
