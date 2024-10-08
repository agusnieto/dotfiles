# Configuraciones Basicas
	# Historial
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
HISTCONTROL=ignoredups

	# Notificar errores
setopt notify
unsetopt autocd beep extendedglob nomatch

	# Teclas estilo Emacs
bindkey -e

# Autocompletado
zstyle :compinstall filename '/home/neho/.zshrc'
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist

# Alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Visual
	# Colores que uso
cyn='%F{cyan}'   # Cyan
clr='%f'         # Reset

	# Prompt
PROMPT="(${USER}@${cyn}%m${clr}) [${cyn}%1~${clr}] ${cyn}%% ${clr}"

# PATHS
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="/home/neho/.nimble/bin:$PATH"

# Ejecutar al abrir
clear
pfetch

# Funciones
paquetes() {
    echo "loading package managers..."

    echo "nvm..."
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Esto carga nvm
    [ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"  # Esto carga autocompletado

    echo "cargo..."
    [ -s "$HOME/.cargo/env" ] && \. "$HOME/.cargo/env"

    echo "done!"
}
