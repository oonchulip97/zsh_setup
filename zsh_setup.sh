#!/bin/bash

# Install prerequisites
sudo apt install curl

# Install zsh and oh-my-zsh
sudo apt install zsh
chsh -s $(which zsh) $(whoami)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install zsh plugins
git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sed -i "s/plugins=(git)/plugins=(git\n\
         fast-syntax-highlighting\n\
         zsh-autosuggestions\n\
         history-substring-search\n\
         fzf\n\
         colored-man-pages)/" $HOME/.zshrc

echo "export TERM=\"xterm-256color\"" >> $HOME/.zshrc
echo "alias glg=\"git log --graph --stat\"" >> $HOME/.zshrc
