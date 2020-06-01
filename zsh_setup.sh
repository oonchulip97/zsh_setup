#!/bin/bash

# Install prerequisites
apt install curl

# Install zsh and oh-my-zsh
apt install zsh
chsh -s $(which zsh) $(whoami)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install zsh plugins
git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/junegunn/fzf.git ${ZSH}/custom/plugins/fzf
${ZSH}/custom/plugins/fzf/install --bin
git clone https://github.com/Treri/fzf-zsh.git ${ZSH}/custom/plugins/fzf-zsh

sed -i "s/plugins=(git)/plugins=(git\n\
         fast-syntax-highlighting\n\
         zsh-autosuggestions\n\
         history-substring-search\n\
         fzf-zsh\n\
         colored-man-pages)/" $HOME/.zshrc

echo "alias glg=\"git log --graph --stat\"" >> $HOME/.zshrc
