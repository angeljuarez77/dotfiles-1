# !/bin/bash

# Last updated 10/31/2019. Check if there are any updates to the packages. Or don't.

sudo apt update

# I didn't add any of the install commands for the guest additions (I have this inside of a vm)
# Something in this worked tho https://askubuntu.com/questions/22743/how-do-i-install-guest-additions-in-a-virtualbox-vm

# I installed stow from here https://launchpad.net/ubuntu/bionic/amd64/stow/2.2.2-1
# I chose the .deb package http://launchpadlibrarian.net/236857449/stow_2.2.2-1_all.deb
sudo apt install stow # I didn't know this was a thing until after and I never tested it

# For git/GitHub
sudo apt install git
sudo apt-get install xclip
# tmux
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# idk how to categorize this
sudo apt install curl
sudo apt-get install libssl-dev libreadline-dev zlib1g-dev
sudo apt-get install gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
# Some C/see stuff ripped off of Samuel Roecas files lol
sudo apt install cmake llvm-6.0 llvm-6.0-dev libclang-6.0-dev
sudo apt-get install pkg-config
sudo apt-get install python3-pip
sudo apt install net-tools

# For the lols and coolness
sudo apt install fortune cowsay bsdgames bsdgames-nonfree
sudo apt install fonts-firacode

# Linux Brew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

# WeeChat - Slack
sudo apt-get install libgcrypt11-dev zlib1g-dev
sudo apt-get install libcurl4-openssl-dev
sudo apt-get install libncurses5-dev libncursesw5-dev
wget -P ~/Downloads https://weechat.org/files/src/weechat-2.6.tar.gz
tar xzf ~/Downloads/weechat-2.6.tar.gz -C ~/Downloads/
rm -rf weechat-2.6.tar.gz
cd ~/Downloads/weechat-2.6
mkdir build
cd build
cmake ..
make
sudo make install
cd
mkdir -p ~/.weechat/python/autoload
cd ~/.weechat/python
curl -O https://raw.githubusercontent.com/wee-slack/wee-slack/master/wee_slack.py
### This install works but when I try to run /python load wee_slack.py inside of weechat
### it says that another script with the
### same name exists and it might be because I deleted the old one and redownloaded it

# GNUtls
# PreReqs
sudo apt-get install -y dash git-core autoconf libtool gettext autopoint
sudo apt-get install -y automake autogen nettle-dev libp11-kit-dev libtspi-dev libunistring-dev
sudo apt-get install -y guile-2.2-dev libtasn1-6-dev libidn2-0-dev gawk gperf
sudo apt-get install -y libunbound-dev dns-root-data bison gtk-doc-tools
sudo apt-get install -y texinfo texlive texlive-generic-recommended texlive-extra-utils

wget -P ~/Downloads/ https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.10.tar.xz
tar xf ~/Downloads/gnutls-3.6.10.tar.xz -C ~/Downloads/
rm -rf ~/Downloads/gnutls-3.6.10.tar.xz

# BitlBee -- You're just going to have to download it from a package manager rather than build it yourself
### wget -P ~/Downloads/ http://get.bitlbee.org/src/bitlbee-3.5.1.tar.gz
### tar xzf ~/Downloads/bitlbee-3.5.1.tar.gz -C ~/Downloads/
### rm -rf ~/Downloads/bitlbee-3.5.1.tar.gz
### sudo apt-get install libglib2.0-dev
### sudo apt-get install gnutls-bin
### sudo apt-get install libnss3-dev
### cd ~/Downloads/bitlbee-3.5.1n

# VIM - Vi IMproved
sudo apt install vim
# git clone https://github.com/neovim/neovim.git ~/neovim
# cd ~/neovim && sudo make install                        <== I don't know if this works
# cd ~
pip3 install --upgrade pynvim
git clone https://github.com/k-takata/minpac.git \
    ~/.vim/pack/minpac/opt/minpac
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.4

# Languages
sudo apt install openjdk-8-jdk # I'm going to have to add this to $PATH JAVA_HOME = /usr/lib/jvm/java-version/bin/
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh # Rust
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 12.13.0
echo 'nodejs 12.13.0' > ~/.tool-versions

asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 2.6.5 # this shit takes forever
echo 'ruby 2.6.5' >> ~/.tool-versions

asdf plugin-add python
asdf install python 3.7.5
echo 'python 3.7.5' >> ~/.tool-versions

# sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Postgres
brew install postgres

# MongoDB -- for some reason during this section homebrew just goes to shit and hangs
# WHILE ALSO APPARENTLY INSTALLING IT AND NEVER EXITING THE PROCESS
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# spring-boot cli
sdk install springboot

# apache
sudo apt install apache2

# apache tomcat 9.0.27
wget -P ~/Downloads/ http://mirrors.advancedhosters.com/apache/tomcat/tomcat-9/v9.0.27/bin/apache-tomcat-9.0.27.tar.gz
tar xzf ~/Downloads/apache-tomcat-9.0.27.tar.gz -C ~/Downloads/

# Maven - I'm just going to go with the easier one - Here's a thing though. https://linuxize.com/post/how-to-install-apache-maven-on-ubuntu-18-04/
sudo apt install maven

#Editors and other GUI tools
sudo apt install snapd
sudo snap install intellij-idea-ultimate --classic # Intellij - Ultimate Edition - https://www.jetbrains.com/help/idea/installation-guide.html
snap install code --classic # VSCode
sudo snap install insomnia
sudo snap install eclipse --classic

cd ~/dotfiles-lilnux && make dotfiles

# zsh
sudo apt install zsh
chsh -s "$(which zsh)"
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

source ~/.zshrc
