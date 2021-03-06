#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Install PHP extensions with PECL
# pecl install memcached imagick

# Install Composer
# curl -sS https://getcomposer.org/installer | php
# mv composer.phar /usr/local/bin/composer

# Install global Composer packages
# /usr/local/bin/composer global require laravel/installer laravel/spark-installer laravel/valet

# Install Laravel Valet
# composer global require laravel/valet

## Create .nvm directory
mkdir $HOME/.nvm

# Install current Node
nvm install node

# Install LTS
nvm install --lts
nvm use --lts

# Install Global NPM (run after NVM is setup)
npm install -g spaceship-prompt

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites

# Moves files .zshrc, .curlrc etc. from $HOME/.dotfiles to $HOME
cp -av $HOME/.dotfiles/.zshrc $HOME/.zshrc
cp -av $HOME/.dotfiles/.hyper.js $HOME/.hyper.js
cp -av $HOME/.dotfiles/.editorconfig $HOME/.editorconfig
cp -av $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global

