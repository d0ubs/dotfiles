#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ping='ping -c 4'
alias muttg='neomutt -f +/gmail/INBOX'
alias mutth='neomutt -f +/hotmail/Inbox'
alias muttu='neomutt -f +/unamur/INBOX'
alias dotfiles='/usr/bin/git --git-dir=/home/dubs/.dotfiles/ --work-tree=/home/dubs'

export EDITOR="vim"
export VISUAL="vim"

set -o vi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

export HISTSIZE="10000" 

PATH=$PATH:/home/dubs/scripts
