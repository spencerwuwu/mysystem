#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


export PS1="\[\e[2m\][\D{%F %a %I:%M %P}]\[\e[22m\] \[\033[38;5;12m\]\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\] \[\033[38;5;12m\]@\[$(tput sgr0)\]\[\033[38;5;7m\]\h\[$(tput sgr0)\]\[\033[38;5;12m\]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]>\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export BROWSER=elinks
# Add RVM to PATH for scripting
[[ -d $HOME/.rvm/bin ]] && export PATH="$PATH:$HOME/.rvm/bin"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . $HOME/.rvm/scripts/rvm
# Ruby gem user_dir
#export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

# history settings
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
LESSHISTFILE=/dev/null

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# bash completion
[[ -r /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
# RVM bash completion
[[ -r $HOME/.rvm/scripts/completion ]] && . $HOME/.rvm/scripts/completion

# colored less
export LESS_TERMCAP_mb=$(tput bold; tput setaf 3)
export LESS_TERMCAP_md=$(tput bold; tput setaf 34)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 0; tput setab 7)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput setaf 33)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)

# aliases
alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'
alias ls='ls --color -F'
alias l='ls --color -F'
alias la='ls --color -AF'
alias ll='ls --color -lAF'
alias gdb='gdb -q'
alias pacman='pacman --color always'
#alias irssi='irssi -c chat.freenode.net -n <nick> -w <key>'

