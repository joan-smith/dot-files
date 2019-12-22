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
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_76.jdk/Contents/Home/

alias lash='ls -Glash'
alias ll='ls -Glh'

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

# Includes the branch info
export PS1="$RED\${?##0} $BLACK{\T} $GRAY\h$BLACK:$BLUE\W$RED\$(__git_ps1)$BLACK\$ "

source activate base> /dev/null 2>&1

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joan/google-cloud-sdk/path.bash.inc' ]; then source '/Users/joan/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/joan/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/joan/google-cloud-sdk/completion.bash.inc'; fi


# added by Anaconda3 2019.10 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/joan/opt/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/joan/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/joan/opt/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/joan/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
