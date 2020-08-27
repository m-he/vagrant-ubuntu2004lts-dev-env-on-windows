#!/bin/bash
useradd -m -s /bin/bash -U he -u 586 --groups wheel
cp -pr /home/vagrant/.ssh /home/he/
chown -R he:he /home/he
echo "%he ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/he