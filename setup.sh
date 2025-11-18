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

# Link tmux config
mv ~/.config/tmux ~/.config/tmux.bak
ln -s `pwd`/tmux ~/.config/tmux
