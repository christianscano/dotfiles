# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# .zshrc - main Zsh configuration file

zsh_plugins="${ZDOTDIR:-$HOME}/.zsh_plugins"

# Check if Antidote is installed and source it
if [[ -r /opt/homebrew/opt/antidote/share/antidote/antidote.zsh ]]; then
	source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
else
	print -u2 "antidote not found, install with Homebrew"
	return 1
fi

# Check if the plugins file exists
if [[ ! -r "${zsh_plugins}.txt" ]]; then
	print -u2 "antidote plugins file not found: ${zsh_plugins}.txt"
	return 1
fi

# If the plugins file is newer than the generated plugins script, regenerate it
if [[ ! "${zsh_plugins}.zsh" -nt "${zsh_plugins}.txt" ]]; then
	antidote bundle <"${zsh_plugins}.txt" >|"${zsh_plugins}.zsh"
fi

# Source the generated plugins script
source "${zsh_plugins}.zsh"

# Source any additional custom configuration files
for config in "$ZDOTDIR"/custom/*.zsh(N); do
	source "$config"
done

unset config zsh_plugins
