#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# nvim
ln -sfn ${BASEDIR}/nvim ~/.config/nvim

# git
ln -sfn ${BASEDIR}/git/.gitconfig ~/.gitconfig



