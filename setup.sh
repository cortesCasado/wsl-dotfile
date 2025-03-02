#!/bin/bash

sudo apt install unzip

# Download and install fnm:
curl -o- https://fnm.vercel.app/install | bash
fnm install --lts
corepack enable pnpm
