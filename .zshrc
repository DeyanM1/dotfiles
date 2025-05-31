if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### ZSH CONFIG ###

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k" # Set theme

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

ENABLE_CORRECTION="true"

HIST_STAMPS="dd.mm.yyyy"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh



# export MANPATH="/usr/local/man:$MANPATH"

export EDITOR="nvim"
export ARCHFLAGS="-arch $(uname -m)"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


## PATH ##
export PATH="/home/deyan/.cargo/bin:$PATH"
export PATH="/home/deyan/.local/bin/:$PATH"


### ALIAS ###

alias cl="clear"
alias update= "sudo apt update"
alias upgrade= "sudo apt upgrade"
alias ls="eza --icons=always"
alias :q="exit"
alias :qa="exit"

## KEY BINDS ##
bindkey "^K" history-search-backward
bindkey "^J" history-search-forward
bindkey "^L" forward-char
bindkey "^H" backward-char
bindkey "^N" clear-screen



eval "$(zoxide init zsh)"
alias cd="z"

### PACKAGES ###

## compinit ##
autoload -U compinit
compinit

## JULIAUP config ##
path=('/home/deyan/.juliaup/bin' $path)
export PATH

## YAZI config ##
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

## BAT (better Cat)
export BAT_THEME=tokyonight_night


