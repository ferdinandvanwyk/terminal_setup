#!/bin/bash

cd
sudo apt-get update
sudo apt-get upgrade

echo "Installing system packages..."
sudo apt-get install vim git gcc gnuplot gnuplot-x11 vlc gparted subversion curl gsl-bin libgsl0-dev

echo "Setting up Vim and terminal colours..."
mkdir .vim_backup
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
sudo apt-get install dconf-cli
git clone git@github.com:Anthony25/gnome-terminal-colors-solarized.git ~/Downloads/gnome-terminal-colors-solarized
cd Downloads/gnome-terminal-colors-solarized
./install

echo "Setting up python virtual environment and installing basic packages..."
sudo apt-get install build-essential libatlas-dev libatlas3gf-base python3-dev libjpeg-dev libxml2-dev libfreetype6-dev libpng-dev liblapack-dev ttf-mscorefonts-installer
sudo apt-get install python3-pip python-pip python-tk python3-tk tk-dev
sudo pip install virtualenv virtualenvwrapper







