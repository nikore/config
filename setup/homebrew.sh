#!/bin/zsh

# Install Homebrew
which -s brew
if [[ $? != 0 ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ln -svfF "${SCRIPT_DIR}/dotfiles/zprofile" "${HOME}/.zprofile"
    source "${HOME}/.zprofile"
else
    brew update
fi
