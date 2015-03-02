# vim: ft=sh

set -o vi

## Git functions for PS1
git_branch()
{
  if [[ ! -d .git ]]; then
    echo NA
  else
    branch=$(git branch --no-color | awk '$1 == "*" {print $NF}')
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

## Rails functions
be()
{
  bundle exec $@
}

console()
{
  if [[ -e bin/rails ]] # assume rails app
  then
    be bin/rails console
  else
    echo rails not found
  fi
}

## Fav aliases.
alias lrt='ls -lrt '
alias gst='git status '

## Runtime setup
PATH=$PATH:~/bin

eval "$(rbenv init -)"

export PS1='bruce:$(git_ps1_info)\j \W $ '
