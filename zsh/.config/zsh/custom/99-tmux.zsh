# Start tmux automatically for interactive local shells.

[[ -o interactive ]] || return
[[ -z "$TMUX" ]] || return
[[ -z "$ZSH_NO_TMUX" ]] || return
[[ "$TERM" != "dumb" ]] || return
command -v tmux >/dev/null || return

exec tmux new-session -A -s main
