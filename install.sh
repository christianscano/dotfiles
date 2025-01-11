#!/bin/zsh

# Install xcode tools
echo "Installing xcode tools..."
xcode-select --install

# Homebrew
echo "Install Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# Taps
echo "Tapping Brew..."
brew tap FelixKratz/formulae
brew tap koekeishiya/formulae

# Formulae
echo "Installing Brew Formulae..."

## Base
brew install borders
brew install wget
brew install watch
brew install ripgrep
brew install jq
brew install grep
brew install sketchybar
brew install stow

# Dev
brew install node
brew install php
brew install ruby
brew install rust

## Research
brew install graphviz

## Tools
brew install feroxbuster
brew install ffuf
brew install awscli
brew install jython
brew install nmap

## Terminal
brew install neovim
brew install tmux

# Casks

# macOS settings
echo ""
defaults write -g NSWindowShouldDragOnGesture -bool true
defaults write -g AppleShowAllExtensions -bool true
defaults write -g KeyRepeat -int 1
defaults write com.apple.dock autohide -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
