# Paths
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="/home/neho/.nimble/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"

# OhMyZsh Theme
ZSH_THEME="lambda-gitster"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" ) # Pool para temas random.

# Opciones de Autocompletado
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"

# Actualizaciones
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 13

# Configuraciones
DISABLE_AUTO_TITLE="true" # Prevenir que cambie el titulo
ENABLE_CORRECTION="true" # Autocorreccion
COMPLETION_WAITING_DOTS="true" # Puntos rojos en autocorreccion
DISABLE_UNTRACKED_FILES_DIRTY="true" # No carga archivos sin trackear para que sea mas rapido
HIST_STAMPS="dd/mm/yyyy"

	# Path custom (sin uso)
# ZSH_CUSTOM=/path/to/new-custom-folder

# Plugins
	# Standards en $ZSH/plugins/
	# Custom en $ZSH_CUSTOM/plugins/
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Usuario

export MANPATH="/usr/local/man:$MANPATH"

	# Languave enviroment
export LANG=en_US.UTF-8

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
