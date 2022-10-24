#! /bin/bash
echo "Path Of Titans Egg by Marcel Baumgartner"
echo "(c) Copyright 2022 - endelon-hosting.de"
cd /mnt/server
echo "Installing utils"
apt update
apt install -y wget
echo "Downloading AlderonGamesCmd"
wget -O AlderonGamesCmd https://launcher-cdn.alderongames.com/AlderonGamesCmd-Linux-x64
echo "Download complete. Marking as executeable"
chmod +x AlderonGamesCmd
echo "Updating files"
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
./AlderonGamesCmd --game path-of-titans --server true --beta-branch $BETA_BRANCH --install-dir .
echo "Creating folder for config files because this game is a weird one"
mkdir -p /mnt/server/PathOfTitans
mkdir -p /mnt/server/PathOfTitans/Saved
mkdir -p /mnt/server/PathOfTitans/Saved/Config
mkdir -p /mnt/server/PathOfTitans/Saved/Config/LinuxServer
echo "Downloading startup script and default config files from Github"
wget -O /mnt/server/PathOfTitans/Saved/Config/LinuxServer/Game.ini https://raw.githubusercontent.com/Endelon-Hosting/eggs/main/pathoftitans/Game.ini
wget -O /mnt/server/startup.sh https://raw.githubusercontent.com/Endelon-Hosting/eggs/main/pathoftitans/startup.sh
echo "Install finished"