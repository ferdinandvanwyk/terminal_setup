terminal_setup
==============

Contains files for setting up the terminal environment in ubuntu.

- .dicolors, .vim, .vimrc should simply be copied to the home folder
- Execute the following command to load and overwrite terminal configuration: 
```
gconftool-2 --load gnome-terminal-conf.xml
```

Vim and Terminal Colours
------------------------

* Pathogen is a Vim extension manager: https://github.com/tpope/vim-pathogen
* Solarized is a Vim colorscheme with support for multiple languages: 
  http://ethanschoonover.com/solarized
* Vim-airline is an extension for pimping your Vim status and tablines:
  https://github.com/bling/vim-airline
* Finally to get solarized colouring in the terminal: 
  https://github.com/Anthony25/gnome-terminal-colors-solarized 


