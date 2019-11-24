#!/bin/sh

sudo apt install -y direnv

echo 'Setting direnv to active virtualenv when cd to project dir...'

cat << EOF >> $HOME/.bashrc
eval "\$(direnv hook bash)"
show_virtual_env() {
  if [[ -n "\$VIRTUAL_ENV" && -n "\$DIRENV_DIR" ]]; then
    echo "(\$(basename \$VIRTUAL_ENV))"
  fi
}
export -f show_virtual_env
PS1='\$(show_virtual_env)'\$PS1
EOF