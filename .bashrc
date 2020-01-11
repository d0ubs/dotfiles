#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias muttg='neomutt -f +/gmail/INBOX'
alias mutth='neomutt -f +/hotmail/Inbox'


PS1='[\u@\h \W]\$ '
export EDITOR="vim"

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
export PATH=~/bin:$PATH
export HISTSIZE="" 

complete -cf sudo

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/share/powerline/bindings/bash/powerline.sh
alias dotfiles='/usr/bin/git --git-dir=/home/dubs/.dotfiles/ --work-tree=/home/dubs'
