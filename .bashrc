#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

yel='\[\033[33m\]'
clr='\[\033[00m\]'
blu='\[\033[34m\]'
mgt='\[\033[35m\]'

# Prompt
PS1="${yel} ${clr} \w${blu} \$${clr} "		#  ~ $

# Quality of life
HISTCONTROL=ignoredups

# Alias
alias diff='diff --color -u'
alias grep='grep --color=auto'
alias tree='tree -C --dirsfirst'

alias cat='bat -p --paging=never'
alias bat='bat --paging=never'

alias ls='lsd'

alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias cbonsai='cbonsai -l -i'

alias x-dlp='yt-dlp --cookies-from-browser firefox'

# Run on start
# clear
# pfetch

# Funcitons
#function load-pkgs() {
#	echo "cargo..."
#	. "$HOME/.cargo/env"
#
#	echo "nvm..."
#	export NVM_DIR="$HOME/.config/nvm"
#	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
#	echo "done"
#}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# fzf
eval "$(fzf --bash)"

# Zoxide
eval "$(zoxide init bash)"
