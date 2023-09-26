# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
	brew
	web-search
 	docker
	z
)

source $ZSH/oh-my-zsh.sh

alias zshrc="vim ~/.zshrc"
alias reload="source ~/.zshrc"
export EDITOR="nvim"
alias vim="nvim"
export LANG=en_US.UTF-8

# confirm before OVERWRITING SOMETHING
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

alias lg='lazygit'

#exa
if [ -x "$(command -v exa)" ]; then
  #alias ls="exa"
  alias ls='exa -al --color=always --group-directories-first' # my preferred listing
  alias la='exa -a --color=always --group-directories-first'  # all files and dirs
  alias ll='exa -l --color=always --group-directories-first'  # long format
  alias lt='exa -aT --color=always --group-directories-first' # tree listing
  alias l.='exa -a | egrep "^\."'
fi

# tmux
alias tn="tmux new -s"
alias tl="tmux ls"
alias ta="tmux attach-session -t"
alias tk="tmux kill-session -t"
alias tka="tmux kill-session -a"

# brew
alias brupr="brew update && brew upgrade && brew upgrade --cask"

#weather
alias danang="curl 'wttr.in/danang?format=v2'"

#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
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

#go
[[ -s "/Users/kaiz/.gvm/scripts/gvm" ]] && source "/Users/kaiz/.gvm/scripts/gvm"
export GOPATH=$HOME/dev/go
export PATH=$PATH:$(go env GOPATH)/bin

#pyenv
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
alias py3nvim="pyenv activate py3nvim"

#ipconfig
alias ip="ipconfig getifaddr en0"

#startship
eval "$(starship init zsh)"

#java 
jdk() {
      version=$1
      unset JAVA_HOME;
      export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
      java -version
}

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

