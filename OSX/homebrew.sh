# tools
brew install git mdless ripgrep jq fd git-delta

# languages
brew install python
brew install nvm
brew install clojure/tools/clojure

# colima
brew install colima docker docker-compose docker-buildx
mkdir -p ~/.docker/cli-plugins
ln -sfn $(which docker-buildx) ~/.docker/cli-plugins/docker-buildx
ln -sfn $(which docker-compose) ~/.docker/cli-plugins/docker-compose

# x86 emulation
brew install qemu lima-additional-guestagents

# azure
brew install azure-cli
brew install --cask git-credential-manager

