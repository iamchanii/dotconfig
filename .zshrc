autoload -Uz compinit
compinit

# tty
export GPG_TTY=$(tty)

# direnv vscode hack
if [[ -n "$VSCODE_INJECTION" && -z "$VSCODE_TERMINAL_DIRENV_LOADED" && -f .envrc ]]; then
    cd ..
    cd -
    export VSCODE_TERMINAL_DIRENV_LOADED=1
fi

# mise 
eval "$($HOME/.local/bin/mise activate zsh)"
eval "$($HOME/.local/bin/mise completion zsh)"

# vim alias
alias vim="nvim"
alias vi="nvim"

# starship
eval "$(starship init zsh)"

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=/opt/homebrew/bin:$PATH

# git alias
alias gs="git switch"
alias gsm="git switch main"