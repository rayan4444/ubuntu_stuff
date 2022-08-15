#!/bin/bash

#####
# Script to automate the installation of a bunch of tools I use often
# Run this script with root privileges /sudo
#####

## System
apt update
apt upgrade

## Linux tools

# Basic apt stuff
apt install software-properties-common apt-transport-https

# wget and curl
apt install wget
apt install curl

# Gnome Tweaks
apt install gnome-tweaks

# Gnome terminal settings
dconf load /org/gnome/terminal/ < gnome_terminal_settings_backup.txt

## Applications

# Google chrime
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb

# Visual Studio Code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt update
apt install code

# Spotify
snap install spotify

# Telegram
snap install telegram-desktop

# Kicad 6.0
add-apt-repository --yes ppa:kicad/kicad-6.0-releases
apt update
apt install --install-recommends kicad

# Fusion 360 (beta)
snap install fusion360 --beta --devmode

# Arduino
apt install Arduino

# Slack
snap install slack

# Notion
snap install notion-snap

## Python stuff

# pip
apt install python3-pip

# pyenv
apt update
apt install make build-essential libssl-dev zlib1g-dev
apt install libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm
apt install libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
curl https://pyenv.run | bash