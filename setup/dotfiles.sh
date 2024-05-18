#!/bin/zsh

if [ ! -d "${HOME}/.oh-my-zsh/" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -d "${HOME}/bin" ]; then
    mkdir ${HOME}/bin
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Install pbtools
    ln -svfF "${SCRIPT_DIR}/bin/pbcopy" "${HOME}/bin/pbcopy"
    ln -svfF "${SCRIPT_DIR}/bin/pbpaste" "${HOME}/bin/pbpaste"
fi

# Symlink config files
ln -svfF "${SCRIPT_DIR}/dotfiles/zshrc" "${HOME}/.zshrc"
ln -svfF "${SCRIPT_DIR}/dotfiles/tmux.conf" "${HOME}/.tmux.conf"
ln -svfF "${SCRIPT_DIR}/dotfiles/alacritty.toml" "${HOME}/.alacritty.toml"
ln -svfF "${SCRIPT_DIR}/dotfiles/gitconfig.template" "${HOME}/.gitconfig"
ln -svfF "${SCRIPT_DIR}/dotfiles/lazydocker-config.yml" "${HOME}/.config/lazydocker/config.yml"
ln -svfF "${SCRIPT_DIR}/dotfiles/lazygit-config.yml" "${HOME}/.config/lazygit/config.yml"
ln -svfF "${SCRIPT_DIR}/nvim" "${HOME}/.config/nvim"

