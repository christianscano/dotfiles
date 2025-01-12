#!/bin/zsh

# -----------------
# General functions
# -----------------

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

# Install xcode tools
echo "Installing xcode tools..."
xcode-select --install

# Homebrew
echo "Install Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# --------------
# macOS settings
# --------------
echo "[+] MacOS Settings..."

# Keyboard
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 15

# Dock
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 38
defaults write com.apple.dock orientation -string "left"

# Finder
defaults write -g AppleShowAllExtensions -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder ShowPathbar -bool true

# Screenshot
defaults write com.apple.screencapture location -string "${HOME}/Downloads"

# Restart applications
killall Dock
killall Finder

#
echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai


