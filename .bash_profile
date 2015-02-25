# vim: ft=sh

set -o vi

git_branch()
{
  [[ ! -d .git ]] && echo N/A
  branch=$(git branch --no-color)
  echo ${branch#* }
}

git_version()
{
  [[ ! -d .git ]] && echo N/A
  ref=$(git log -n 1 --oneline)
  echo ${ref%% *}
}

alias lrt='ls -lrt '
alias gst='git status '

PATH=$PATH:~/bin

eval "$(rbenv init -)"

PS1='bruce:($(git_branch)):$(git_version):\j \W $ '
export PS1
