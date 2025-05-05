#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
ibus-daemon -xrd

# Variables Por Defecto
#export TERMINAL=kitty
export EDITOR=nano

# Colores que uso
#cyn='\[\033[01;36m\]'   # Cyan
cyn='\[\033[36m\]'      # Cyan (sin negrita)
clr='\[\033[00m\]'      # Reset

# Prompt
PS1="(\u@${cyn}\h${clr}) [\w] ${cyn}$ ${clr}"

# Visuales
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias tree='tree -C --dirsfirst'
alias cbonsai='cbonsai -l -i'

# Calidad de vida
HISTCONTROL=ignoredups

# PATHS
	# Agregar el ~/.local/bin y scripts al PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"
	# Path de .NET para git credential manager
export PATH="$PATH:$HOME/.dotnet/tools"
	# Nim - Nimble
export PATH=/home/neho/.nimble/bin:$PATH
	# Z
#. /home/neho/Projects/z/z.sh

# Ejecutar al abrir
clear
pfetch

# Funciones
function paquetes() {
	echo "cargando paquetes..."

	echo "cargo..."
	. "$HOME/.cargo/env"

	echo "node..."
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	echo "listo!"
}
