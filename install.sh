#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# nvim
ln -sfn ${BASEDIR}/nvim ~/.config/nvim

# git
ln -sfn ${BASEDIR}/git/.gitconfig ~/.gitconfig

# ghci
ln -snf ${BASEDIR}/ghci/ghci.conf ~/.ghc/ghci.conf

# alacritty
ln -snf ${BASEDIR}/alacritty ~/.config/alacritty

# polybar
ln -snf ${BASEDIR}/polybar ~/.config/polybar

# xmonad
ln -snf ${BASEDIR}/xmonad/xmonad.hs ~/.xmonad/xmonad.hs

# fish
ln -snf ${BASEDIR}/fish/config.fish ~/.config/fish/config.fish
ln -snf ${BASEDIR}/fish/functions ~/.config/fish/functions

# bash
ln -snf ${BASEDIR}/bash/bashrc ~/.bashrc 
ln -snf ${BASEDIR}/bash/bash_profile ~/.bash_profile

# xorg
ln -snf ${BASEDIR}/xorg/xinitrc ~/.xinitrc

# dunst
mkdir -p ~/.config/dunst
ln -snf ${BASEDIR}/dunst/dunstrc ~/.config/dunst/dunstrc

# zathura
mkdir -p ~/.config/zathura
ln -snf ${BASEDIR}/zathura/zathurarc ~/.config/zathura/zathurarc
