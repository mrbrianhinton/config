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
# $HOME/.composer/vendor/bin/valet install

# Install Global NPM
npm install -g spaceship-prompt

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites

# Moves files .zshrc, .curlrc etc. from $HOME/.dotfiles to $HOME
cp -av $HOME/.dotfiles/.zshrc $HOME/.zshrc
cp -av $HOME/.dotfiles/.hyper.js $HOME/.hyper.js
cp -av $HOME/.dotfiles/.editorconfig $HOME/.hyper.js
cp -av $HOME/.dotfiles/.curlrc $HOME/.curlrc
cp -av $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
