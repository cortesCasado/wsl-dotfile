#!/bin/bash

sudo apt install unzip

# Download and install fnm:
curl -o- https://fnm.vercel.app/install | bash
source ~/.bashrc
fnm install --lts
corepack enable pnpm
