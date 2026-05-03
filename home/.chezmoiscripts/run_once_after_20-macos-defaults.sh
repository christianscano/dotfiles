#!/bin/sh
set -u

safe_defaults() {
	if ! defaults write "$@" 2>/dev/null; then
		printf '[chezmoi] defaults write failed: %s\n' "$*" >&2
	fi
}

echo "[chezmoi] Applying macOS defaults"

# Mission Control
safe_defaults com.apple.dock mru-spaces -bool false

# Keyboard
safe_defaults NSGlobalDomain KeyRepeat -int 1
safe_defaults NSGlobalDomain InitialKeyRepeat -int 15

# Finder
safe_defaults NSGlobalDomain AppleShowAllExtensions -bool true
safe_defaults -g AppleShowAllExtensions -bool true
safe_defaults com.apple.desktopservices DSDontWriteUSBStores -bool true
safe_defaults com.apple.desktopservices DSDontWriteNetworkStores -bool true
safe_defaults com.apple.finder DisableAllAnimations -bool true
safe_defaults com.apple.finder ShowPathbar -bool true
chflags nohidden "$HOME/Library" 2>/dev/null || true

# Enable subpixel font rendering on non-Apple LCDs.
safe_defaults NSGlobalDomain AppleFontSmoothing -int 2
safe_defaults com.apple.finder FXDefaultSearchScope -string "SCcf"

# Dock
safe_defaults com.apple.dock launchanim -bool false
safe_defaults com.apple.dock show-recents -bool false
safe_defaults com.apple.dock autohide -bool true
safe_defaults com.apple.dock tilesize -int 38
safe_defaults com.apple.dock orientation -string "left"
safe_defaults com.apple.dock autohide-delay -float 0
safe_defaults com.apple.dock autohide-time-modifier -int 0

# Menu bar
safe_defaults com.apple.menuextra.battery ShowPercent -string "YES"
safe_defaults com.apple.menuextra.battery ShowTime -string "NO"

# General
safe_defaults -g AppleShowScrollBars -string "Always"
safe_defaults com.apple.screencapture location -string "$HOME/Downloads"
safe_defaults com.apple.LaunchServices LSQuarantine -bool false

# Disable Cmd+Space for Spotlight.
/usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.symbolichotkeys.plist" -c "Set AppleSymbolicHotKeys:64:enabled false" 2>/dev/null || true

# Stop Music/iTunes from responding to keyboard media keys.
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2>/dev/null || true

softwareupdate --all --install --force || true

killall SystemUIServer 2>/dev/null || true
killall Dock 2>/dev/null || true
killall Finder 2>/dev/null || true
