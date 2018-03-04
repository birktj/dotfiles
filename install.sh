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
