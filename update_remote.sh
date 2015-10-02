#!/usr/bin/env sh

cp ~/.bashrc bashrc
cp ~/.vimrc vimrc
cp ~/.tmux.conf tmux
git add .
git commit -m "latest changes synced"
git push origin master

