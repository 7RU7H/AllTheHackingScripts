#!/bin/bash

sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git
wait
curl https://pyenv.run | bash
wait
echo '' >> ~/.zshrc
echo '# Python 2.7 required!' >> ~/.zshrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init --path)"\nfi' >> ~/.zshrc
echo '' >> ~/.zshrc

exec $SHELL
pyenv install 2.7.18
wait
pyenv global 2.7.18
pyenv global system
pyenv init
exit
