# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}mbp %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

bindkey -e

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# zoxide
eval "$(zoxide init zsh)"

# zellij
alias zls='zellij list-sessions'
alias zjp='zellij -l project'
alias zjc='zellij -l code-and-shell'
alias zjt='zellij -l stacked'
alias zj0='zellij -l clean'

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

load_openrouter_api_key() {
	if [ -n "${OPENROUTER_API_KEY:-}" ]; then
		return 0
	fi

	if ! command -v bw >/dev/null 2>&1; then
		return 1
	fi

	case "$(bw status 2>/dev/null || true)" in
		*'"status":"unlocked"'*) ;;
		*) return 1 ;;
	esac

	local bw_result
	bw_result="$(bw get notes OpenAPIRouterKey 2>/dev/null || true)"
	if [ -n "$bw_result" ]; then
		export OPENROUTER_API_KEY="$bw_result"
		return 0
	fi

	return 1
}

load_openrouter_api_key >/dev/null 2>&1
