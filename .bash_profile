# vim: ft=sh

PS1='bruce: $PWD $ '
export PS1

set -o vi

alias lrt='ls -lrt '

PATH=$PATH:~/bin

gst()
{
  git status
}

eval "$(rbenv init -)"
