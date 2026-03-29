#!/bin/sh

ROOT_DIR="$HOME/dotfiles"
BREW_PACKAGES = "$ROOT_DIR/brew/Brewfile"
SCRIPTS_DIR="$ROOT_DIR/scripts"

# ------------------
# General functions
# ------------------

_seekConfirmation_() {
  # v1.0.0
  echo "${bold}$@${reset}"
  while true; do
    read -r -p " (y/n) " yn
    case $yn in
      [Yy]*) return 0 ;;
      [Nn]*) return 1 ;;
      *) echo "Pleas answer yes or no" ;;
    esac
  done
}


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
#
echo "[+] MacOS Settings..."
zsh "$SCRIPTS_DIR/mac.sh"


