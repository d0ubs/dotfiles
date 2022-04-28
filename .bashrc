#
# ~/.bashrc
#

# If not running interactively, don't do anything
# XDG Dirs
export XDG_CONFIG_HOME="/home/dubs/.config"
export XDG_DATA_HOME="/home/dubs/.local/share"

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

#[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ping='ping -c 4'
alias muttg='neomutt -f +/gmail/INBOX'
alias mutth='neomutt -f +/hotmail/INBOX'
alias muttu='neomutt -f +/unamur/INBOX'
alias dotfiles='/usr/bin/git --git-dir=/home/dubs/.dotfiles/ --work-tree=/home/dubs'
alias mbsync="mbsync -c $XDG_CONFIG_HOME/mbsync/config"

set -o vi


PATH=$PATH:/home/dubs/scripts

# Notmuch
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/notmuchrc"
export NMBGIT="$XDG_DATA_HOME/notmuch/nmbug"

# GPG-Agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
# Ask the PIN on correct terminal
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

complete -cf sudo
