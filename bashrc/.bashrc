#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colores que uso
cyn='\[\033[36m\]'      # Cyan (sin negrita)
clr='\[\033[00m\]'      # Reset

# Prompt
PS1="(\u@${cyn}\h${clr}) [\w] ${cyn}$ ${clr}"

# Calidad de vida
HISTCONTROL=ignoredups

# Alias
alias grep='grep --color=auto'
alias tree='tree -C --dirsfirst'
alias cbonsai='cbonsai -l -i'
alias cmatrix='cmatrix -ba'
alias cat='bat --paging=never'
alias ls='lsd'

alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# alias v='nvim'
# alias vim='nvim'

# alias scrot='scrot "/home/neho/Pictures/Screenshots/Screenshot From $(date +"%Y-%m-%d %H-%M-%S").png" -p -c -d 3'

# Ejecutar al abrir
clear
pfetch

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
