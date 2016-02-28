# vim: ft=sh

set -o vi

# load functions
bash_functions=~/.bash_functions
if [[ -d ~/.bash_functions ]]
then
    cd $bash_functions
else
    echo "Problem with bash_function directory" 2>&1
    exit 1
fi

# source bash_functions
# expect current directory to be $bash_functions
for f in *
do
    source $f
done
cd - 1>/dev/null 2>&1      # go to previous directory

## Fav aliases.
alias lrt='ls -lrt '
alias gst='git status '

## Runtime setup
PATH=$PATH:~/bin

eval "$(rbenv init -)"

export PS1='bruce:$(git_ps1_info)\j \W $ '
