#!/bin/bash

# http://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/

brew install coreutils

brew tap homebrew/dupes

brew install binutils
brew install diffutils
brew install ed --default-names
brew install findutils --default-names
brew install gawk
brew install gnu-indent --default-names
brew install gnu-sed --default-names
brew install gnu-tar --default-names
brew install gnu-which --default-names
brew install gnutls --default-names
brew install grep --default-names
brew install gzip
brew install screen
brew install watch
brew install wdiff --with-gettext
brew install wget
brew install emacs
brew install file-formula
brew install git
brew install less
brew install openssh --with-brewed-openssl
brew install perl518   # must run "brew tap homebrew/versions" first!
brew install python --with-brewed-openssl
brew install rsync
brew install svn
brew install unzip
brew install vim --override-system-vi
brew install macvim --override-system-vim --custom-system-icons
brew install zsh

###

brew install ponysay
brew install cowsay
brew install fortune
brew install multitail
brew install ssh-copy-id
brew install htop
brew install gpg
