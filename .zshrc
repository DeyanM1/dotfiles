if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### ZSH CONFIG ###

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k" # Set theme

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

ENABLE_CORRECTION="false"

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
alias :q="exit"
alias :qa="exit"

## KEY BINDS ##
bindkey "^[k" history-search-backward
bindkey "^[j" history-search-forward
bindkey "^[l" forward-char
bindkey "^[h" backward-char
bindkey "^[n" clear-screen





### PACKAGES ###



## FZF
eval "$(fzf --zsh)"

fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}




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

## EZA
alias ls="eza --icons=always"

## The Fuck
# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)

## Zoxide
eval "$(zoxide init zsh)"
alias cd="z"
