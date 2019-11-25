#!/bin/sh

add-apt-repository -y ppa:deadsnakes/ppa
apt install -y python3.8-distutils python3.8-dev 
ln -sfn /usr/bin/python3.8 /usr/bin/python
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
rm get-pip.py
pip install virtualenv yapf pylint ipdb
