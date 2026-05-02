#!/bin/sh

ROOT_DIR="$HOME/dotfiles"
BREW_PACKAGES = "$ROOT_DIR/brew/Brewfile"
SCRIPTS_DIR="$ROOT_DIR/scripts"

# ------------
# xcode tools
# ------------

echo "[+] Installing xcode tools..."
xcode-select --install

# ---------
# Homebrew
# ---------

echo "[+] Install Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

echo "[+] Install packages..."
brew bundle --file $BREW_PACKAGES

# ---------------
# macOS settings
# ---------------

echo "[+] MacOS Settings..."
zsh "$SCRIPTS_DIR/mac.sh"
