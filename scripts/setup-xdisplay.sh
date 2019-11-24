#!/bin/bash
echo 'Setting XDisplay...'
if [[ ! -v DISPLAY ]]; then
    cat <<EOT >> $HOME/.bashrc
export DISPLAY=172.16.0.1:0.0
EOT
fi
