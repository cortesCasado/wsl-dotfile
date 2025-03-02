#!/bin/bash

curl -sL "https://raw.githubusercontent.com/cortesCasado/wsl-dotfile/main/.bashrc" >> ~/.bashrc
sudo apt install unzip fzf zoxide

# Download and install fnm:
curl -o- https://fnm.vercel.app/install | bash
source ~/.bashrc
fnm install --lts
corepack enable pnpm
pnpm -v
