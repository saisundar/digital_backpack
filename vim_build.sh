#!/bin/bash
# Ubuntu requirements: mercurial ncurses-dev python-dev
# run 
#chmod +x vim_build.sh && ./vim_build.sh
#afeter this
email="saisundr@yelp.com"
tmp=$HOME/.vim/tmp
src="$tmp/src"
old_dst=$HOME/bin/vim7.4
dst=$HOME/bin/vim-7.4
python27_config=/usr/lib/python2.7/config-x86_64-linux-gnu/
python26_config=/usr/lib/python2.6/config-x86_64-linux-gnu/
python_config=

if [ -d "$python27_config" ]; then
    python_config=$python27_config
elif [ -d "$python26_config" ]; then
    python_config=$python26_config
else
    echo "Could not find Python config directory."
    exit 1
fi

[[ -d "$tmp" ]] || mkdir -vp $tmp
[[ -d "$tmp/vim_source" ]] && rm -fr "$tmp/vim_source"

if [[ -d "$src" ]]; then
    cd $src
    git fetch && git pull || exit 1
else
    git clone https://github.com/vim/vim $src || exit 1
    cd $src
fi

./configure \
    --with-features=huge \
    --enable-gui=no \
    --enable-multibyte \
    --enable-cscope \
    --enable-pythoninterp \
    --with-python-config-dir=$python_config \
    --prefix="$dst" \
    --with-compiledby=$email || exit 1

[[ -d "$dst" ]] || mkdir -vp $dst

make && make install || exit 1

ln -sfv $dst/bin/vim     $HOME/digi_backpack/bin
ln -sfv $dst/bin/vimdiff $HOME/digi_backpack/bin

echo
$dst/bin/vim --version | head | grep --color "VIM - Vi IMproved 7.4"
$dst/bin/vim --version | head | grep --color "Included patches"
$dst/bin/vim --version | head | grep --color "Compiled by $email"
$dst/bin/vim --version | grep -E --color "[-+]python"
echo -e "\ninstalled to: $dst\n"

[[ -d ${old_dst} ]] && rm -fr ${old_dst}

