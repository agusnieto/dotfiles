#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colores que uso
cyn='\[\033[36m\]'      # Cyan (sin negrita)
clr='\[\033[00m\]'      # Reset
blu='\[\033[34m\]'

# Prompt
PS1="\w${blu} \$${clr} "			# ~ $
# PS1="[\w] ${cyn}$ ${clr}"			# [~] $
# PS1="(\u@${cyn}\h${clr}) [\w] ${cyn}$ ${clr}"	# (neo@arch) [~] $

# Calidad de vida
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
alias cmatrix='cmatrix -kba'

alias v='vim'

alias x-dlp='yt-dlp --cookies-from-browser firefox'

# Ejecutar al abrir
# clear
# pfetch

# Funciones
function paquetes() {
	echo "cargando paquetes..."

	echo "cargo..."
	. "$HOME/.cargo/env"

	echo "node..."
	export NVM_DIR="$HOME/.config/nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	echo "listo!"
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Zoxide
eval "$(zoxide init bash)"
