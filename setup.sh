#!/bin/bash

# Variables
PARTIAL_BASH_URL="https://raw.githubusercontent.com/cortesCasado/wsl-dotfile/main/.bashrc"
CADENA="# From my dotfiles"

# Verifica si la cadena está en el archivo destino
if ! grep -q "$CADENA" ~/.bashrc; then
    # Descarga el contenido y lo agrega al final del archivo destino
    curl -sL "$URL" >> ~/.bashrc
    echo "Contenido agregado exitosamente."
else
    echo "La cadena '$CADENA' ya está presente en el archivo. No se realizó la concatenación del bashrc."
fi

PROGRAMS="unzip fzf zoxide"
sudo apt install "$PROGRAMS"

# FNM
if ! command -v fnm >/dev/null 2>&1; then
    echo "fnm no está instalado. Ejecutando script de instalación..."
    curl -fsSL https://fnm.vercel.app/install | bash
    source ~/.bashrc
else
    echo "starship ya está instalado."
fi

fnm install --lts
corepack enable pnpm
pnpm -v

# Starship
if ! command -v starship >/dev/null 2>&1; then
    echo "Starship no está instalado. Ejecutando script de instalación..."
    curl -sS https://starship.rs/install.sh | sh
    echo -e '\n\n#Starship config\neval "$(starship init bash)"\n\n' >> ~/.bashrc
    source ~/.bashrc
else
    echo "Starship ya está instalado."
fi

mkdir -p ~/.config && starship preset bracketed-segments -o ~/.config/starship.toml

# Rust-lang
if ! command -v rustc >/dev/null 2>&1; then
    echo "Rust no está instalado. Ejecutando script de instalación..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
    echo "Rust ya está instalado."
fi
. "$HOME/.cargo/env"
