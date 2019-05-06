#!/bin/bash

set -e

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install meld
brew cask install iterm2

#sudo rm -rf /Applications/iTunes.app
