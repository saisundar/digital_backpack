if [ "$YELP_IN_SANDBOX" ]; then
    export PS1="$PS1(sandbox)\$ "
fi

PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\]\[\e[1;37m\]'

export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
export HISTFILESIZE=20000
export HISTSIZE=10000
HISTTIMEFORMAT="%d/%m/%y %T "

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.sub 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'

alias SR="scribereader"
alias SRP="scribereader -e sfo2"
alias PROD="ssh -A adhoc-sfo2"
alias DEV="ssh -A dev2-devc"


genCtag() {
if [ $# -eq 0 ]
then
    make clean
    make
    /usr/bin/ctags -L <(find . -name '*.py') --fields=+iaS --python-kinds=-i --sort=yes --extra=+q --exclude=./virtualenv_emr/
else
    /usr/bin/ctags -L <(find . -name '*.py') --fields=+iaS --python-kinds=-i --sort=yes --extra=+q --exclude=./virtualenv_emr/
fi    
}

ApplyPatch() {

cd ~/patchfiles/
select PATCH in `ls`;
do
    cd -
    echo $PWD
    echo "output of git apply --check" 
    git apply --check ~/patchfiles/$PATCH
    echo "applying... "
    git apply  ~/patchfiles/$PATCH
    break
done

}

Patch() {
filename=""
fail=0
name="random_name.patch"
while [ "$1" != "" ]; do
    case $1 in
        -f | --file )           shift
                                filename=$1
                                ;;
        -n | --patchname )      shift
                                name=$1
                                ;;
        -h | --help )           fail=1
                                ;;
        * )                     usage
                                fail=1
    esac
    shift
done
if [ $fail -ne 1 ]
then
    git diff $filename > ~/patchfiles/$name
    echo "patchfile created at ~/patchfiles/$name"
    cat ~/patchfiles/$name
else
    echo "usage: Patch -f <filename> -n <what to patch>"
fi
}

CO() {
mkdir tmp
cd tmp
COM="`git branch`"
select BRANCH in $COM
do
    git co $BRANCH
    cd ..
    rm -r tmp
    break
done
}

Col() { awk '{print $('$(echo $* | sed -e s/-/NF-/g -e 's/ /),$(/g')')}'; }

GitGrab() {

paths="git@git.yelpcorp.com:"
paths="$paths$1"
echo $paths
git clone $paths /scratch/saisundr/repos/`basename $1`
cd ~/scratchspace/repos/`basename $1`

}

GitDiffy() {

if [ $# -eq 1 ]
then
    git diff $1^ $1
else
    git diff $2 $1    
fi    

}

GitAdd() {
mkdir tmp
cd tmp
COM="`git diff --name-only`"
select FILE in $COM
do
    git add ../$FILE
    cd ..
    rm -r tmp
    break
done
}

GitReset() {
mkdir tmp
cd tmp
COM="`git diff --name-only`"
select FILE in $COM
do
    git co -- ../$FILE
    cd ..
    [ -e tmp ] && rm -r tmp
done
}

GitFiles() {

mkdir tmp
cd tmp
COM="`git log --oneline|head -20|tr " " "_"`"
select COMMIT in $COM
do
    COMM=`echo $COMMIT|tr "_" " "|Col 1`
    FILES=`git diff-tree --no-commit-id --name-only -r $COMM |tr "\n" " "`
    cd ..
    rm -fr tmp
    if [ $# -eq 1 ]
    then
        vim -p $FILES
    else
        echo $FILES|tr " " "\n"
    fi    
    break
done
}


Repme() {
if [ $# -eq 0 ]
then
    cd ~/scratchspace/repos
    select REPO in `ls`
    do
        cd $REPO
        break
    done
else
    cd ~/pg/yelp-main
fi    
}

