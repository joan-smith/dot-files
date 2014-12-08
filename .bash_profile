BLACK="\[\e[30;0m\]"
GRAY="\[\e[0;32m\]"
RED="\[\e[31;1m\]"
BLUE="\[\e[34;1m\]"
NC="\[\e[0m\]" # No Color

PS1="$RED\${?##0} $BLACK{\T} $GRAY\h$BLACK:$BLUE\W$BLACK\$ "

PATH=" /usr/bin/vim /usr/local/Cellar/vim/7.4.488/bin/:${PATH}"
PATH="/usr/local/bin:${PATH}"
PATH="/Users/joans/.rbenv/shims:${PATH}"
export PATH


export PAGER="less -siJmnw"
export CXX=/usr/bin/clang++
export CC=/usr/bin/clang
export EDITOR="vim"
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/joans/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

alias lash='ls -Glash'
alias ll='ls -Glh'
alias vssh='cd /crashlytics/hosted-chef; vagrant ssh pipeline'
alias drmf='docker rm -f '

prod_zgrep() {
   dsh -M -g $1 -r ssh "zgrep -i $3 '$2' /srv/$1/current/log/production.log*.gz"
}


prod_grep_fast() {
    dsh -M -g $1 -r ssh "grep -i $3 '$2' /srv/$1/current/log/production.log"
}

prod_grep() {
    dsh -M -g $1 -r ssh "grep -i $3 '$2' /srv/$1/current/log/production.log /srv/$1/current/log/production.log.1"
}

prod_collector_grep() {
    dsh -M -g $1 -r ssh "grep -i $3 '$2' /var/log/collector/unicorn.stderr.log"
}

#Force history to be appended on each shell insert
export PROMPT_COMMAND='history -a'

#Increase max history size
export HISTCONTROL=erasedups
export HISTSIZE=100000

#Ensure appending
shopt -s histappend

#Bash auto completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
      fi

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=true



source /usr/local/git/contrib/completion/git-completion.bash
source /usr/local/git/contrib/completion/git-prompt.sh
# Includes the branch info
export PS1="$RED\${?##0} $BLACK{\T} $GRAY\h$BLACK:$BLUE\W$RED\$(__git_ps1)$BLACK\$ "

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM
