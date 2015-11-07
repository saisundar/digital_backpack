#!/usr/bin/env sh

cp ~/.bashrc bashrc
cp ~/.vimrc vimrc
cp ~/.tmux.conf tmux
cp ~/.zshrc zshrc
git add .
git commit -m "latest changes synced"
git push origin master

