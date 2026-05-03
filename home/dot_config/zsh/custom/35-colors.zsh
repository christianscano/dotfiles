# Ayu Dark CLI colors

ls_colors=(
	'di=1;38;2;83;189;250'   # directories: blue
	'ln=38;2;144;225;198'     # symlinks: cyan
	'ex=1;38;2;127;217;98'    # executables: green
	'or=1;38;2;234;108;115'   # broken symlinks: red
	'mi=1;38;2;234;108;115'   # missing files: red

	'*.zip=38;2;240;113;120'
	'*.tar=38;2;240;113;120'
	'*.gz=38;2;240;113;120'
	'*.md=38;2;144;225;198'
	'*.json=38;2;249;175;79'
	'*.yml=38;2;249;175;79'
	'*.yaml=38;2;249;175;79'
	'*.toml=38;2;249;175;79'
)
export LS_COLORS="${(j.:.)ls_colors}"
unset ls_colors

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':fzf-tab:*' fzf-flags \
	'--color=fg:#bfbdb6,fg+:#ffffff,bg:#0b0e14,bg+:#1e232b' \
	'--color=hl:#cda1fa,hl+:#d2a6ff,info:#ffb454,prompt:#53bdfa' \
	'--color=pointer:#d2a6ff,marker:#7fd962,spinner:#f9af4f,header:#686868,border:#1e232b'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#686868'

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=#53bdfa'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#53bdfa'
ZSH_HIGHLIGHT_STYLES[function]='fg=#53bdfa'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#53bdfa'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#cda1fa'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#f9af4f'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#f9af4f'
ZSH_HIGHLIGHT_STYLES[path]='fg=#90e1c6,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#686868'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#d2a6ff'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#ffb454'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#686868'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ea6c73,bold'
