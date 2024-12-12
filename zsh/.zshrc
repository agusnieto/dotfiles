# Paths
export TERMINAL=kitty
export EDITOR=nano
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="/home/neho/.nimble/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
        # Z
#. /home/neho/Projects/z/z.sh

# OhMyZsh Theme
# ZSH_THEME="xiong-chiamiov"
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

clear
pfetch

# Funciones

# Cargar paquetes npm, cargo, etc.
paquetes() {
        echo "cargando paquetes..."

        echo "cargo..."
        . "$HOME/.cargo/env"

        echo "node..."
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Carga el nvm
        [ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"  # Autocompletado
        echo "listo!"
}

# Abrir yazi y quedarme en la carpeta al salir.
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Scripts Propios
export PATH="$HOME/.local/scripts:$PATH"


# Power Level 10k Theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
