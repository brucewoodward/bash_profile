# vim: ft=sh

set -o emacs

load_bash_functions()
{
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
}


## Fav aliases.
alias ll='ls -l '
alias lrt='ls -lrt '
alias gst="git status; git stash list --pretty=format:'%gd: %Cblue%h%Creset %Cgreen[%ar]%Creset %s'"
alias glog="git log --oneline --decorate "
alias cdc='clear; tput reset; cd '
alias psg='ps -ef | grep '
alias v='vim '

alias lg='ls | egrep "$@"'
alias lgi='ls | egrep -i "$@"'

# I know
alias grpe='grep '
alias mysql='mysql -b '

alias a='ansible '
alias ap='ansible-playbook '
alias as='ansible-playbook --syntax-check '
alias ad='ansible-doc '

bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set show-all-if-ambiguous on"
bind "set colored-completion-prefix"

export HISTCONTROL="ignoredups:erasedups" # no duplicate entries
export HISTSIZE=100000                    # big big history
export HISTFILESIZE=100000                # big big history
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear:cdc:lrt:gst:psg"
export HISTTIMEFORMAT="%Y%m%d %T "
export PROMPT_COMMAND="history -a; history -n"
shopt -s histappend
shopt -s cmdhist
shopt -s dirspell
shopt -s globstar

export CDPATH=.:/Users/bruce/code
export EDITOR=vim

# Feature of brew on linux?
#export LD_LIBRARY_PATH=/home/linuxbrew/.linuxbrew/Cellar/openssl/1.0.2q_2/lib

#export PS1='bruce:\j \A \W $ '

## Runtime setup
export PATH=~/bin:/usr/bin:/usr/local/bin:~/.local/bin

# Exit if this is isn't a login shell.
shopt -q login_shell || return 0

# Everything below this point is only going to happen if this is a login shell.
load_bash_functions

export PS1='bruce:$(git_ps1_info)/\j/\A \W $ '

export LESS_TERMCAP_so=$(tput bold; tput setaf 7; tput setab 0)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)

export GOROOT=/usr/local/go
export GOPATH=/usr/local/go/src
export GOBIN=/usr/local/go/bin

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

unset -f command_not_found_handle 2>/dev/null
. "$HOME/.cargo/env"
