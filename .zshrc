# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"

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


alias djproject="django-admin startproject"
alias pymn="python manage.py"

alias ts='ts-node'

#pyenv
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
alias py3nvim="pyenv activate py3nvim"

function nvimvenv {
  if [[ -e "$VIRTUAL_ENV" && -f "$VIRTUAL_ENV/bin/activate" ]]; then
    source "$VIRTUAL_ENV/bin/activate"
    command nvim "$@"
    # deactivate
 else
    command nvim "$@"
  fi
}

alias nvim=nvimvenv


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

#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
# export PATH=$PATH:$(go env GOPATH)/bin

#java 
jdk() {
      version=$1
      unset JAVA_HOME;
      export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
      java -version
}

#ipconfig
alias ip="ipconfig getifaddr en0"

#startship
eval "$(starship init zsh)"

# brew
alias brupr="brew update && brew upgrade && brew upgrade --cask"

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


# alias neofetch="neofetch --size 5"
# neofetch --ascii_distro Manjaro 
neofetch

# fzf
export FZF_CTRL_R_OPTS="--reverse"
export FZF_TMUX_OPTS="-p"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# gcc
export CC="/opt/homebrew/bin/gcc-13"


#term
export TERM="screen-256color"

#yabai
alias ybs="yabai --restart-service"
#skhd
alias sks="skhd --restart-service"
#sketchybar
alias scb="brew services restart sketchybar"

# emacs
alias emacs="open -a /Applications/Emacs.app"
