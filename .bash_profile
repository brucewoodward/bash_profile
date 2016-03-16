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
alias ll='ls -l '
alias lrt='ls -lrt '
alias gst="git status; git stash list --pretty=format:'%gd: %Cblue%h%Creset %Cgreen[%ar]%Creset %s'"
alias cdc='clear; tput reset; cd '
alias psg='ps -ef | grep '

## Runtime setup
PATH=$PATH:~/bin

eval "$(rbenv init -)"

bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set show-all-if-ambiguous on"

export HISTCONTROL="ignoredups:erasedups" # no duplicate entries
export HISTSIZE=100000                    # big big history
export HISTFILESIZE=100000                # big big history
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear:cdc:lrt:gst:psg"
export PROMPT_COMMAND="history -a; history -n"
shopt -s histappend
shopt -s cmdhist
shopt -s dirspell
shopt -s globstar

export PS1='bruce:$(git_ps1_info)\j \W $ '
export CDPATH=.:/Users/bruce/code

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
