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

# Verifica si 'fnm' está instalado
if ! command -v fnm >/dev/null 2>&1; then
    echo "fnm no está instalado. Ejecutando script de instalación..."
    curl -fsSL https://fnm.vercel.app/install | bash
    source ~/.bashrc
else
    echo "fnm ya está instalado."
fi

fnm install --lts
corepack enable pnpm
pnpm -v
