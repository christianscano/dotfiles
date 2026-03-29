if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$("/opt/homebrew/bin/brew" shellenv)"
fi

autoload -Uz compinit
compinit
