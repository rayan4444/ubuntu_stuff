# Ubuntu stuff

Things that come in handy when (re)installing ubuntu/linux


## How to (on a brand new install with default Desktop image)
0) update and upgrade
```shell
sudo apt update -y
sudo apt upgrade -y
```
1) Install git 
```shell
sudo apt install -y git
```
2) setup ssh key on github
```shell
# generate new key : keep default location (press enter) and then enter passphrase (or not, and just press enter again)
ssh-keygen -t ed25519 -C "your_email@example.com"

# start ssh-agent in the background
eval "$(ssh-agent -s)"

# add ssh private key to the ssh-agent
ssh-add ~/.ssh/id_ed25519

# print ssh key so you can copy-paste it into ```Settings > ssh keys``` of your github account
ssh-add ~/.ssh/id_ed25519

# test ssh connection 
ssh -T git@github.com

```
3) clone the repo
```shell
git clone <this repo>
```

4) run the setup script

```shell
sudo ./setup.sh
```

5) Diff the original ```.bashrc``` with the one here to add git branch visualisation, aliases etc. 

## Content overview
* ```.bashrc```: bashrc file that I used in my previous ubuntu install, maybe diff it with the current one to keep some of the stuff (aliases, git branch etc.)
* ```setup.sh```: to install packages I use a lot: vscode, chrome, slack, spotify, notion, kicad, fusion 360, gnome tweaks, telegram, arduino, coolterm
* ```throttlestop_setup.sh```: my Dell has a CPU throttling issue whenever I use it on battery, this script sets up a systemd service on boot up that disables throttling