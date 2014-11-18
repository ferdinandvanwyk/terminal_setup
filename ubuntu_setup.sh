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
sudo apt-get install build-essential libatlas-dev libatlas3gf-base python3-dev libjpeg-dev libxml2-dev libfreetype6-dev libpng-dev liblapack-dev
sudo apt-get install python3-pip python-pip python-tk python3-tk tk-dev
sudo pip install virtualenv
sudo virtualenv -p /usr/bin/python3.4 python_virt_env
. ~/python_virt_env/bin/activate
pip3 install numpy scipy matplotlib scikit-learn ipython netcdf4 sphinx nose
deactivate
sudo virtualenv -p /usr/bin/python2.7 python_virt_env2
. ~/python_virt_env2/bin/activate
pip install numpy scipy matplotlib scikit-learn ipython netcdf4 sphinx nose
deactivate

echo "Installig packages needed for GS2..."
sudo apt-get install gcc gfortran openmpi-bin libopenmpi-dev libfftw3-3 libfftw3-mpi-dev libfftw3-dev libfftw3-bin libnetcdf-dev netcdf-bin

echo "Downloading and installing CR and gs2crmod..."
sudo curl -sSL https://get.rvm.io | bash -s stable
. ~/.rvm/scripts/rvm
type rvm | head -n 1
rvm install 2.1.2
rvm use 2.1 --default

mkdir code
cd code
svn co svn://svn.code.sf.net/p/coderunner/svn/installer_new coderunner_svn
cd coderunner_svn
mkdir $HOME/custom_software
sudo make -j 4 hd all rb PREFIX=$HOME/custom_software
sudo apt-get install rubygems-integration ruby-dev
sudo gem install rb-gsl coderunner gs2crmod genecrmod







