alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ping='ping -c 4'
alias muttg='neomutt -f +/gmail/INBOX'
alias mutth='neomutt -f +/hotmail/Inbox'
alias muttu='neomutt -f +/unamur/INBOX'

export EDITOR="vim"

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
export HISTSIZE="10000" 
export HISTFILE="$HOME/.zsh_history"

#complete -cf sudo

alias dotfiles='/usr/bin/git --git-dir=/home/dubs/.dotfiles/ --work-tree=/home/dubs'

export PATH=/home/dubs/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/lib/jvm/default/bin:/opt:/opt/idea-IU-182.5262.2/bin:/opt/idea-IU-182.5262.2/bin

# Vim mode
bindkey -v
plugins+=(zsh-vi-mode)

# Oh-my-zsh
ZSH_THEME=kolo
#plugins+=(git)
source ~/.oh-my-zsh/oh-my-zsh.sh
