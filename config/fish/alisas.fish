# When quitting ranger using Z, change the shell pwd to the last visited directory
#!/usr/bin/env bash
# Use neovim for vim if present
# Tmux
# "ranger" is an autoload function defined at ../functions/ranger
# Quick navigation (J for Jump)
#Pacman for software managment
# ls
# GNU version
# General
# Download
# Dotfiles management
#command -v nvim >/dev/null && alias vim="nvim" vi="nvim" v="nvim" vimdiff="nvim -d"
# brew
#alias ydv="youtube-dl --add-metadata --restrict-filenames -i"
#alias yda="ydv -x -f bestaudio/best"
#alias wget="wget --continue --progress=bar --timestamping"
alias v='nvim'
alias vi='nvim'
alias update='sudo pacman -Syyu'
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias tty-clock="tty-clock -S -c -C4 -D -s -n"
alias tm="tmux-sessionizer"
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '
alias search='sudo pacman -Qs'
alias rm='rm -vr'
#alias rm="rm -iv"
alias remove='sudo pacman -R'
alias ra="ranger"
alias portage="yay -S"
alias ping="ping -c 4"
alias ping="ping -c 4"
alias orphans='sudo pacman -Rns $(pacman -Qtdq)'
alias nv='nvim'
alias new='touch'
alias mv='mv -v'
#alias mv="mv -iv"
alias mk="mkdir -pv"
#alias md="mkdir -pv"
alias lx="l -X"  # sort by extension
#alias ls="gls -hFN --color=auto --group-directories-first --hyperlink=auto" # Use GNU ls (brew install coreutils)
alias ls='exa --icons'
alias lr="l -R"  # recursive
alias lm="l -tr" # sort by modification time, i.e., mtime, newest last
#alias l="ls -l"
alias ll='lsd -la --group-directories-first'
#alias ll='exa -lahFT --color=always --icons --sort=size --group-directories-first'
alias lk="l -Sr" # sort by size, largest last
alias linstall='sudo pacman -U '
alias l='exa -lahF --color=always --icons --sort=size --group-directories-first'
alias ld="ls -1|lolcat" 
alias lcs='clear' 
alias lc="lm -c"  # sort by change (status) time, i.e., ctime, newest last
#alias la="ls -A"
alias la='exa --icons -la'
#alias kw='kwrite'
alias ka="killall"
alias jv="cd ~/.config/nvim"
alias jr="cd ~/.config/rofi"
alias jp="cd ~/projects"
alias jp="cd ~/.config/polybar"
alias jk="cd ~/.config/kitty"
alias jg="cd ~/gitrepos"
alias jf="cd ~/.config/fish"
alias jdo="cd ~/Documents"
alias jd="cd ~/Downloads"
alias jc="cd ~/.config"
alias jb="cd ~/Library/CloudStorage/Dropbox/"
alias ja="cd ~/.config/alacritty"
alias install='sudo pacman -S'
alias install="sudo pacman -S"
alias installnvim='git clone https://github.com/Irmb7108/mynvim.git ~/.config/nvim'
#alias grep="ggrep --color=auto"
alias gc='git clone'
alias extract="tar -xvzf"
alias e='exit'
#alias du="gdu -h"
alias dot="git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
#alias diff="diff --color=auto" # GNU diffutils required (brew install diffutils)
#alias df="gdf -h"
alias del='rm -rv'
#alias curl="curl --continue-at - --location --progress-bar --remote-name --remote-time"
alias cpu="ps axch -o cmd:15,%cpu --sort=-%cpu | head"
alias cp='cp -rv'
#alias cp="cp -iv"
alias cls='clear'
alias clrcache='sudo pacman -Scc'
alias clone='cd $HOME/Downloads/git-repos/ && git clone'
alias chx='chmod +x'
#alias chown="gchown --preserve-root -v"
#alias chmod="gchmod --preserve-root -v"
alias chat-gpt='ipython ~/test1/chatgpt.py'
alias cd..='cd ..'
alias cclock="watch -t -n1 'date +%T | figlet' | lolcat"
alias c="clear"
alias brU="brew upgrade"
alias bru="brew update"
#alias aria="aria2c --max-connection-per-server=5 --continue"
alias akring='sudo pacman -Sy archlinux-keyring --noconfirm'
#-----------
#
#













