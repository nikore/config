#!/bin/zsh

export SCRIPT_DIR=${0:a:h}

ln -svfF "${SCRIPT_DIR}/home-manager/home.nix" "${HOME}/.config/home-manager/home.nix"
ln -svfF "${SCRIPT_DIR}/home-manager/modules" "${HOME}/.config/home-manager/modules"
ln -svfF "${SCRIPT_DIR}/home-manager/desktop.nix" "${HOME}/.config/home-manager/desktop.nix"

home-manager switch
