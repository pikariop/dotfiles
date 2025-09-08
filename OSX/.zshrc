ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="bira"

alias ls='ls -alTFhG'

setopt AUTO_PUSHD

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LESSCHARSET=UTF-8
export RIPGREP_CONFIG_PATH=~/.ripgreprc

zstyle -s ':completion:*:hosts' hosts _ssh_config
[[ -r ~/.ssh/config ]] && _ssh_config+=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p'))
zstyle ':completion:*:hosts' hosts $_ssh_config

