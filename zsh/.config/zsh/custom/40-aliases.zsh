# Aliases and custom commands

# ----------
# Commands
# ----------

alias ss='lsof -iTCP -sTCP:LISTEN -n -P'
alias ls='eza -l --icons always'
# alias ls='eza -1 --icons always'
alias ll='eza -la --icons always'
alias lt='eza -a --tree --level=2 --icons always'
alias brew_dump='brew bundle dump --file="$HOME/dotfiles/brew/Brewfile" --force --describe'
alias yabai_update='echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai'

# --------
# Folders
# --------

alias phd='cd ~/University/phd/projects'
