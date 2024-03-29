# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="bira"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vagrant)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

for func in ~/src/dotfiles/functions/*; do
    source $func;
done

# Source custom ls colors if present
if [ -e ~/.dircolors ]; then
    source ~/.dircolors 2> /dev/null
fi

alias ls='ls -alFh --color'
alias nano='vim'

setopt AUTO_PUSHD

export EDITOR=/usr/bin/vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$PATH:~/bin
export FT2_SUBPIXEL_HINTING=1

# http://unix.stackexchange.com/questions/52099/how-to-append-extend-zshell-completions
zstyle -s ':completion:*:hosts' hosts _ssh_config
[[ -r ~/.ssh/config ]] && _ssh_config+=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p'))
zstyle ':completion:*:hosts' hosts $_ssh_config

hash -rf


