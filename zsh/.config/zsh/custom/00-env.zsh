# Environment and PATH configuration

# Homebrew environment setup
if [[ -x /opt/homebrew/bin/brew ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Add Docker completions
if [[ -d "$HOME/.docker/completions" ]]; then
	fpath=("$HOME/.docker/completions" $fpath)
fi

# Add custom paths to PATH
path=(
	/opt/homebrew/opt/ruby/bin
	/opt/homebrew/opt/curl/bin
	"$HOME/.cargo/bin"
	"$HOME/.local/bin"
	$path
)
typeset -U path PATH
