#!/bin/bash

# Install prerequisites
sudo apt install curl

# Install zsh and oh-my-zsh
sudo apt install zsh
chsh -s $(which zsh) $(whoami)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install zsh plugins
git clone https://github.com/z-shell/F-Sy-H.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/F-Sy-H
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sed -i "s/plugins=(git)/plugins=(git\n\
         F-Sy-H\n\
         zsh-autosuggestions\n\
         history-substring-search\n\
         fzf\n\
         colored-man-pages)/" $HOME/.zshrc

echo "export TERM=\"xterm-256color\"" >> $HOME/.zshrc
echo "alias glg=\"git log --graph --stat\"" >> $HOME/.zshrc
