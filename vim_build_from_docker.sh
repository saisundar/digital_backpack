#!/bin/bash
set -exv
# Ubuntu requirements: mercurial ncurses-dev python-dev
# run 
tmp=$HOME/.vim/tmp
src="$tmp/src"

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

if [[ -d "$src" ]]; then
    echo "vim source code is already present in $src"
else
    git clone https://github.com/vim/vim $src || exit 1
fi

build_args1=" --with-features=huge --enable-gui=no --enable-multibyte --enable-cscope"
build_args2=" --enable-pythoninterp --with-python-config-dir=$python_config"
build_args3="--with-compiledby=$email"
build_comm="./configure $build_args1 $build_args2 $build_args3"
docker build -t vim_build -f vim_build_dockerfile .
docker run -v $src:/work vim_build /bin/bash -c "cd /work &&
$build_comm && cd /work/src && make && make install && cp /usr/local/bin/vim /work"
