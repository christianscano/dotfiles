# Dotfiles

Personal macOS and Linux configuration, managed with [chezmoi](https://www.chezmoi.io/). The repository configures Zsh, Homebrew packages, Docker completions, and supporting command-line tools.

## Quick start

Clone the repository wherever you want to keep it, then run the installer from its root:

```sh
./install.sh
```

The script uses the directory containing `install.sh` as the chezmoi source directory. It does not create the usual `~/.local/share/chezmoi` symlink.

On macOS, only Apple Silicon is supported. The installer installs Xcode Command Line Tools, Homebrew, and chezmoi when needed. On Linux, Homebrew must already be installed at `/home/linuxbrew/.linuxbrew`; the script then installs chezmoi through Homebrew.

### Safe modes

```sh
# Show the changes chezmoi would make
./install.sh --check

# Apply files without running chezmoi scripts
./install.sh --config-only
```

## Daily workflow

After starting a new Zsh session, use `cm` instead of typing the full chezmoi command. It is an alias for chezmoi with this repository's active working tree as the source directory.

```sh
# Review pending changes, then apply them
cm diff
cm apply

# Edit a managed target and add the change back to this repository
cm edit ~/.config/zsh/.zshrc
cm re-add ~/.config/zsh/.zshrc
```

If the alias is not available, use `chezmoi --source /path/to/dotfiles` in its place.

## Homebrew packages

Run `brew_sync` after installing or removing packages with Homebrew:

```sh
brew_sync
```

It saves the current platform's package list with `brew bundle dump`, updates the generated `~/.config/brew/Brewfile`, and removes the legacy `~/.Brewfile` through chezmoi.

## How it is organized

`.chezmoiroot` makes `home/` the source state, so chezmoi only manages files below that directory.

| Area | Purpose |
| --- | --- |
| `home/dot_zshenv` | Becomes `~/.zshenv`. |
| `home/dot_config/zsh/` | Zsh configuration, including the `cm` alias. |
| `home/dot_config/brew/Brewfile.tmpl` | Generates the Brewfile for the current operating system. |
| `home/.chezmoitemplates/brew/` | Platform-specific package manifests: `Brewfile.darwin` and `Brewfile.linux`. |
| `home/dot_local/bin/executable_brew_sync.tmpl` | Becomes `~/.local/bin/brew_sync`. |
| `home/.chezmoiscripts/` | Scripts executed by `chezmoi apply`, including Docker completion generation when Docker is installed. |
| `home/remove_dot_Brewfile` | Removes the legacy `~/.Brewfile`. |
