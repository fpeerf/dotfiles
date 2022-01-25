#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install gs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

brew install zsh-syntax-highlighting
brew install autojump
brew install wget
brew cask install font-hack-nerd-font
brew install qemu
brew install awk
brew install --cask microsoft-edge
brew install --cask google-chrome
brew install --cask kitty
brew install neovim
brew install tmux
brew install ripgrep
brew install zsh
brew install antibody
brew install zsh-autosuggestions
brew install fzf
brew install the-silver-searcher
brew install tmuxinator
brew install ccat
brew install gnupg
brew install pinentry-mac
brew install git-delta
brew install less
brew install bat
brew install git
brew install gpg2
brew install archey
brew install --cask docker
brew install --cask alacritty
brew install tree
brew install --cask font-jetbrains-mono
brew install bash
brew install --cask amethyst
brew install languagetool
brew install gnu-sed
brew install lua-language-server
brew install fontforge
brew install python-configparser
sudo port install qemu
sudo port install julia
sudo port install tree-sitter
sudo port install fd
sudo port install coreutils
sudo port install findutils
sudo port install tree-sitter-cli
sudo port install xorg-server
# sudo port install fontconfig

python3 -m pip install numpy
python3 -m pip install pandas
pip3 install --user requests
pip3 install --upgrade mackup
pip3 install black flake8
pip3 install neovim
# pip3 install powerline-status
# pip3 install pudb
pip3 install pyre2
pip3 install cdifflib
pip3 install Pygments
pip3 install pynvim
# pip3 install fontforge
pip3 install configparser

npm install -g eslint
npm install --save-dev eslint-config-prettier
npm install difflib
npm install -g neovim
npm install --save-dev --save-exact prettier
# Remove outdated versions from the cellar.
brew cleanup
