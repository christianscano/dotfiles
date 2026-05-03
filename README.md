# dotfiles

Dotfile gestiti con [chezmoi](https://www.chezmoi.io/).

## Layout

- `.chezmoiroot` punta a `home/`, quindi solo `home/` viene usata come source state.
- `home/dot_zshenv` diventa `~/.zshenv`.
- `home/dot_config/zsh/dot_zshrc.tmpl` diventa `~/.config/zsh/.zshrc`.
- `home/dot_config/brew/Brewfile.tmpl` genera `~/.config/brew/Brewfile` includendo il Brewfile corretto per OS.
- `home/.chezmoitemplates/brew/Brewfile.darwin` contiene i pacchetti Homebrew per macOS.
- `home/.chezmoitemplates/brew/Brewfile.linux` contiene i pacchetti Homebrew per Linux.
- `home/remove_dot_Brewfile` rimuove il vecchio `~/.Brewfile`.
- `home/dot_local/bin/executable_brew_sync.tmpl` diventa `~/.local/bin/brew_sync`.
- `home/.chezmoiscripts/run_after_30-docker-completions.sh.tmpl` genera le completion Docker in `~/.config/zsh/completions/_docker` se Docker è installato.
- `home/.chezmoiscripts/` contiene script eseguiti da `chezmoi apply`.

## Installazione

```sh
./install.sh
```

Su macOS e Linux i pacchetti passano da Homebrew. Su macOS sono supportati solo Apple Silicon e `/opt/homebrew`.

## Comandi

```sh
chezmoi --source ~/dotfiles diff
chezmoi --source ~/dotfiles apply
chezmoi --source ~/dotfiles edit ~/.config/zsh/.zshrc
chezmoi --source ~/dotfiles re-add ~/.config/zsh/.zshrc
brew_sync
```

Per verificare senza applicare:

```sh
./install.sh --check
```

`brew_sync` aggiorna il Brewfile sorgente del sistema corrente (`Brewfile.darwin` o `Brewfile.linux`) con `brew bundle dump`, poi rigenera `~/.config/brew/Brewfile` e rimuove il vecchio `~/.Brewfile` con chezmoi.

`install.sh` usa sempre `--source ~/dotfiles`; non viene creato un symlink in `~/.local/share/chezmoi`.
