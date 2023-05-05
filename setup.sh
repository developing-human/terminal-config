#!/bin/bash

# Link alacritty config
mv ~/.config/alacritty ~/.config/alacritty.bak
ln -s `pwd`/alacritty ~/.config/alacritty

# Link nvim config
mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bak
ln -s `pwd`/nvim/init.vim ~/.config/nvim/init.vim

mv ~/.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json.bak
ln -s `pwd`/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

# Link tmux config
mv ~/.tmux.conf ~/.tmux.conf.bak
ln -s `pwd`/tmux/.tmux.conf ~/.tmux.conf
