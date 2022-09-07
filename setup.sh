#!/bin/bash

#####
# Script to automate the installation of a bunch of tools I use often
# Run this script with root privileges / sudo
#####

## System
apt update -y
apt upgrade -y

## Linux tools

# Basic apt stuff
apt install -y software-properties-common apt-transport-https

# wget and curl
apt install -y wget
apt install -y curl

# net tools
apt install -y net-tools

# Gnome Tweaks
apt install -y gnome-tweaks

# Gnome terminal settings
dconf load /org/gnome/terminal/ < gnome_terminal_settings_backup.txt

## Applications

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install -y ./google-chrome-stable_current_amd64.deb

# Visual Studio Code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt update
apt install -y code

# Spotify
snap install spotify

# Telegram
snap install telegram-desktop

# Kicad 6.0
add-apt-repository --yes ppa:kicad/kicad-6.0-releases
apt update -y
apt install -y --install-recommends kicad

# Fusion 360 (beta)
snap install fusion360 --beta --devmode

# Arduino
apt install -y arduino

# Slack
snap install slack

# Notion
snap install notion-snap

# Latex
# so far I only managed to make the setup work if I install the full package. Can uninstall useless lang packages to save space if needed.
apt install texlive-full

## Python stuff

# pip
apt install -y python3-pip

# pyenv
apt update -y
apt install -y make build-essential libssl-dev zlib1g-dev
apt install -y libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm
apt install -y libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
curl https://pyenv.run | bash