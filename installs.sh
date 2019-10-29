# !/bin/bash

# Last updated 10/29/2019. Check if there are any updates. Or don't.

sudo apt update

# I didn't add any of the install commands for the guest additions (I have this inside of a vm)
# Something in this worked tho https://askubuntu.com/questions/22743/how-do-i-install-guest-additions-in-a-virtualbox-vm

# I installed stow from here https://launchpad.net/ubuntu/bionic/amd64/stow/2.2.2-1
# I chose the .deb package http://launchpadlibrarian.net/236857449/stow_2.2.2-1_all.deb
# sudo apt install stow # I didn't know this was a thing until after and I never tested it

# For git/GitHub
sudo apt install git
sudo apt-get install xclip

# VIM - Vi IMproved
sudo apt install vim
sudo apt install neovim
git clone https://github.com/k-takata/minpac.git \
    ~/.vim/pack/minpac/opt/minpac
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# tmux
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# idk how to categorize this
sudo apt install curl
sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev

# For the lols and coolness
sudo apt install fortune cowsay bsdgames bsdgames-nonfree
sudo apt install fonts-firacode

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

# sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# spring-boot cli
sdk install springboot

# apache
sudo apt install apache2

# apache tomcat 9.0.27 - this didn't work from the install script because it downloaded to the wrong place
# wget http://mirrors.advancedhosters.com/apache/tomcat/tomcat-9/v9.0.27/bin/apache-tomcat-9.0.27.tar.gz ~/Downloads
# tar xzf ~/Downloads/apache-tomcat-9.0.26.tar.gz # The unzipped tarball has more instructions but Intellij and/or Eclipse allows you to just choose the folder

# Maven - I'm just going to go with the easier one - Here's a thing though. https://linuxize.com/post/how-to-install-apache-maven-on-ubuntu-18-04/
sudo apt install maven

#Editors
sudo snap install intellij-idea-ultimate --classic # Intellij - Ultimate Edition - https://www.jetbrains.com/help/idea/installation-guide.html
snap remove vscode
snap install code --classic # VSCode

# zsh
sudo apt install zsh
chsh -s "$(which zsh)"
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

source ~/.zshrc
