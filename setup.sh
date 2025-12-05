#!/bin/bash

# Link alacritty config
mv ~/.config/alacritty ~/.config/alacritty.bak
ln -s `pwd`/alacritty ~/.config/alacritty

# Link nvim config
mv ~/.config/nvim ~/.config/nvim.bak
ln -s `pwd`/nvim ~/.config/nvim

# Link hypr config
mv ~/.config/hypr ~/.config/hypr.bak
ln -s `pwd`/hypr ~/.config/hypr

# Link waybar config
mv ~/.config/waybar ~/.config/waybar.bak
ln -s `pwd`/waybar ~/.config/waybar

# Link dunst config
mv ~/.config/dunst ~/.config/dunst.bak
ln -s `pwd`/dunst ~/.config/dunst

# Link walker config
mv ~/.config/walker ~/.config/walker.bak
ln -s `pwd`/walker ~/.config/walker

# Link elephant config
mv ~/.config/elephant ~/.config/elephant.bak
ln -s `pwd`/elephant ~/.config/elephant

# Link tmux config
# tpm is cloned into ~/.tmux, NOT ~/.config/tmux, per docs
mv ~/.config/tmux ~/.config/tmux.bak
ln -s `pwd`/tmux ~/.config/tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
