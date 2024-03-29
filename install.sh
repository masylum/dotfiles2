#!/bin/bash

chezmoi init

pushd ~/.local/share/chezmoi
  git remote add origin https://github.com/masylum/dotfiles2.git
  git branch -M main
  git pull origin main
popd

chezmoi apply

source ~/.bashrc

echo "Done!"
