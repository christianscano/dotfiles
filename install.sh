#!/bin/sh
set -eu

DOTFILES_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
CHEZMOI_CONFIG="$HOME/.config/chezmoi/chezmoi.toml"
CHECK_ONLY=0
CONFIG_ONLY=0

for arg in "$@"; do
	case "$arg" in
		--check) CHECK_ONLY=1 ;;
		--config-only) CONFIG_ONLY=1 ;;
		*)
			echo "Usage: ./install.sh [--check] [--config-only]" >&2
			exit 1
			;;
	esac
done

echo "[+] Dotfiles source: $DOTFILES_DIR"

if [ "$(uname -s)" = "Darwin" ]; then
	if [ "$(uname -m)" != "arm64" ]; then
		echo "This setup supports macOS Apple Silicon only." >&2
		exit 1
	fi

	if ! xcode-select -p >/dev/null 2>&1; then
		echo "[+] Installing Xcode Command Line Tools..."
		xcode-select --install || true
	fi

	if [ -x /opt/homebrew/bin/brew ]; then
		eval "$(/opt/homebrew/bin/brew shellenv)"
	fi
elif [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if ! command -v brew >/dev/null 2>&1; then
	if [ "$(uname -s)" = "Darwin" ]; then
		echo "[+] Installing Homebrew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		eval "$(/opt/homebrew/bin/brew shellenv)"
	else
		echo "Homebrew is required on Linux and must already be installed." >&2
		exit 1
	fi
fi

brew analytics off >/dev/null 2>&1 || true

if ! command -v chezmoi >/dev/null 2>&1; then
	echo "[+] Installing chezmoi..."
	brew install chezmoi
fi

if [ ! -f "$CHEZMOI_CONFIG" ]; then
	echo "[+] Initializing chezmoi config..."
	chezmoi --source "$DOTFILES_DIR" init
fi

if [ "$CHECK_ONLY" -eq 1 ]; then
	echo "[+] Dry-run chezmoi apply..."
	chezmoi --source "$DOTFILES_DIR" apply --dry-run --verbose
elif [ "$CONFIG_ONLY" -eq 1 ]; then
	echo "[+] Applying configs without scripts..."
	chezmoi --source "$DOTFILES_DIR" apply --exclude=scripts
else
	echo "[+] Applying dotfiles..."
	chezmoi --source "$DOTFILES_DIR" apply
fi
