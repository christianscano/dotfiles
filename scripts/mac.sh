#!/bin/sh

# ----------------
# Mission Control
# ----------------

defaults write com.apple.dock "mru-spaces" -bool "false"


# ---------
# Keyboard
# ---------

defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15


# -------
# Finder
# -------

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write -g AppleShowAllExtensions -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder ShowPathbar -bool true
chflags nohidden ~/Library

# enable subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

echo "Use current directory as default search scope in Finder"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"


# -----
# Dock
# -----

defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 38
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0

# -------
# topbar
# -------

defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "NO"


# --------
# General
# --------

defaults write -g AppleShowScrollBars -string "Always"
defaults write com.apple.screencapture location -string "${HOME}/Downloads"

# disable CMD+space for spotlight"
/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c "Set AppleSymbolicHotKeys:64:enabled false"

# "Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

# stop iTunes from responding to the keyboard media keys"
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null


# update Apple developer utils"
softwareupdate --all --install --force

killall SystemUIServer
killall Dock
killall Finder