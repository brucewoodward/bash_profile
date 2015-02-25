# vim: ft=sh

set -o vi

git_branch()
{
  if [[ ! -d .git ]]; then
    echo NA
  else
    branch=$(git branch --no-color)
    echo ${branch#* }
  fi
}

git_ref()
{
  if [[ ! -d .git ]]; then
    echo NA
  else
    ref=$(git log -n 1 --oneline)
    echo ${ref%% *}
  fi
}

git_ps1_info()
{
  branch=$(git_branch)
  ref=$(git_ref)
  if [[ $branch = NA ]]; then
    echo ''
  else
    echo "($branch:$ref):"
  fi
}

alias lrt='ls -lrt '
alias gst='git status '

PATH=$PATH:~/bin

eval "$(rbenv init -)"

PS1='bruce:$(git_ps1_info)\j \W $ '
export PS1
