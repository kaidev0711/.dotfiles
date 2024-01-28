# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
neofetch
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	zsh-syntax-highlighting
	# git
	zsh-autosuggestions
	brew
	web-search
	z
)

source $ZSH/oh-my-zsh.sh

alias zshrc="hx ~/.zshrc"
alias reload="source ~/.zshrc"
export EDITOR="hx"
export LANG=en_US.UTF-8

# confirm before OVERWRITING SOMETHING
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

#exa
if [ -x "$(command -v exa)" ]; then
  #alias ls="exa"
  alias ls='exa -al --color=always --group-directories-first' # my preferred listing
  alias la='exa -a --color=always --group-directories-first'  # all files and dirs
  alias ll='exa -l --color=always --group-directories-first'  # long format
  alias lt='exa -aT --color=always --group-directories-first' # tree listing
  alias l.='exa -a | egrep "^\."'
fi

# brew
alias brupr="brew update && brew upgrade && brew upgrade --cask"

#weather
alias danang="curl 'wttr.in/danang?format=v2'"

#ipconfig
alias ip="ipconfig getifaddr en0"

#lazygit
alias lg="lazygit"

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

# tmux
alias tn="tmux new -s"
alias tl="tmux ls"
alias ta="tmux attach-session -t"
alias tk="tmux kill-session -t"
alias tka="tmux kill-session -a"

export GOPATH=$HOME/Development/_go
export PATH=$PATH:$(go env GOPATH)/bin


#docker
alias dkps="docker ps"
alias dkst="docker stats"
alias dkpsa="docker ps -a"
alias dkimgs="docker images"
alias dkcpup="docker-compose up -d"
alias dkcpdown="docker-compose down"
alias dkcpstart="docker-compose start"
alias dkcpstop="docker-compose stop"
alias lzd='lazydocker'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#pyenv
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
alias py3nvim="pyenv activate py3nvim"

#rust
source "$HOME/.cargo/env"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
fi


#lf file
export PATH=$PATH:~/.local/bin

eval "$(starship init zsh)"

function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
