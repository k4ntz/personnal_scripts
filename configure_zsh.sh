#!/bin/sh
yes | apt-get update
yes | apt-get install zsh curl git fonts-hack-ttf tmux
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

export ZSH="$HOME/.oh-my-zsh"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/junegunn/fzf.git ${ZSH}/custom/plugins/fzf
${ZSH}/custom/plugins/fzf/install --bin
git clone https://github.com/Treri/fzf-zsh.git ${ZSH}/custom/plugins/fzf-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
cp .p10k.zsh ~/.p10k.zsh
cp .zshrc ~/.zshrc
chsh -s $(which zsh)
echo set-option -g default-shell /bin/zsh >> ~/.tmux.conf
zsh
