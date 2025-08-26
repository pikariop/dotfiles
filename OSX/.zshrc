ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="bira"

for func in src/dotfiles/functions/*; do
    source $func;
done

alias ls='ls -alTFhG'

# https://gist.github.com/quickshiftin/9130153
# Short of learning how to actually configure OSX, here's a hacky way to use
# GNU manpages for programs that are GNU ones, and fallback to OSX manpages otherwise
alias man='_() { echo $1; man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1 1>/dev/null 2>&1;  if [ "$?" -eq 0 ]; then man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1; else man $1; fi }; _'

setopt AUTO_PUSHD

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LESSCHARSET=UTF-8

zstyle -s ':completion:*:hosts' hosts _ssh_config
[[ -r ~/.ssh/config ]] && _ssh_config+=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p'))
zstyle ':completion:*:hosts' hosts $_ssh_config

