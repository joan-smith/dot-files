BLACK="\[\e[30;0m\]"
GRAY="\[\e[0;32m\]"
RED="\[\e[31;1m\]"
BLUE="\[\e[34;1m\]"
NC="\[\e[0m\]" # No Color

PS1="$RED\${?##0} $BLACK{\T} $GRAY\h$BLACK:$BLUE\W$BLACK\$ "

PATH="/usr/local/bin:${PATH}"
export PATH

export PAGER="less -siJmnw"
export EDITOR="vim"

alias lash='ls -Glash'
alias ll='ls -Glh'

#Force history to be appended on each shell insert
export PROMPT_COMMAND='history -a'

#Increase max history size
export HISTCONTROL=erasedups
export HISTSIZE=100000

source ~/.bash_git
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=true

# Includes the branch info
export PS1="$RED\${?##0} $BLACK{\T} $GRAY\h$BLACK:$BLUE\W$RED\$(__git_ps1)$BLACK\$ "


