#!/bin/bash

# --------------------------- #
# ----- RUN ME AS ROOT! ----- #
# --------------------------- #

# ------------------------------------------------- #
# ----- INSTALL Debian APT AVAILABLE SOFTWARE ----- #
# ------------------------------------------------- #

# System updates
apt -y update
apt -y upgrade
apt -y dist-upgrade

# Display Manager & Desktop Environment
apt install -y gnome gnome-tweaks
apt install -y gnome-shell-extension-prefs chrome-gnome-shell

# Download GNOME extensions
wget https://extensions.gnome.org/extension-data/dash-to-dockmicxgx.gmail.com.v84.shell-extension.zip
wget https://extensions.gnome.org/extension-data/apps-menugnome-shell-extensions.gcampax.github.com.v52.shell-extension.zip
wget https://extensions.gnome.org/extension-data/VitalsCoreCoding.com.v61.shell-extension.zip

# Install GNOME extensions
gnome-extensions install dash-to-dockmicxgx.gmail.com.v84.shell-extension.zip
gnome-extensions install apps-menugnome-shell-extensions.gcampax.github.com.v52.shell-extension.zip
gnome-extensions install VitalsCoreCoding.com.v61.shell-extension.zip

# Delete GNOME extension files
rm dash-to-dockmicxgx.gmail.com.v84.shell-extension.zip
rm apps-menugnome-shell-extensions.gcampax.github.com.v52.shell-extension.zip
rm VitalsCoreCoding.com.v61.shell-extension.zip

# General CLI tools
apt install -y wget gpg curl apt-transport-https speedtest-cli

# Essential coding tools
apt install -y gcc g++ gcc-multilib g++-multilib gcc-mingw-w64-base
apt install -y build-essential devscripts debhelper dh-make
apt install -y make cmake cmake-gui git

# dev files
apt install -y libx11-dev libwayland-dev
apt install -y libncurses-dev libssl-dev libcurl4-openssl-dev default-libmysqlclient-dev libopendkim-dev libboost-dev libopencv-dev libreadline-dev
apt install -y libgtk-3-dev qtcreator qtbase5-dev qtbase5-examples qt5-doc qt5-doc-html qtbase5-doc-html

# * See NOTES at the bottom for details on linking and compiling * #

# Code Editors and IDE's
apt install -y nano gedit scite kate codeblocks

# -------------------------------------- #
# ----- GENERAL SOFTWARE AND TOOLS ----- #
# -------------------------------------- #

# Graphical Uncomplicated Firewall
apt install -y gufw

# Firefox (web browser)
apt install -y firefox-esr

# Evolution & Thunderbird (email clients)
apt install -y evolution thunderbird

# LibreOffice suite
apt install -y libreoffice

# Image editing & painting software
apt install -y krita inkscake

# VLC Media Player
apt install -y vlc

# Media Info
apt install -y mediainfo mediainfo-gui

# MKV Tool Nix
apt install -y mkvtoolnix mkvtoolnix-gui

# Quick Emulator (virtual machines)
apt install -y qemu-system

# Virtual Machine Manager
apt install -y virt-manager

# Screen Recorder
apt install -y simplescreenrecorder

# Video Editor
apt install -y kdenlive

# Open Broadcaster Software Studio (OBS Studio)
apt install -y obs-studio

# ------------------------------------------- #
# ----- INSTALL Debian NON-APT SOFTWARE ----- #
# ------------------------------------------- #

# ------------------------- #
# ----- Google Chrome ----- #
# ------------------------- #

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# ------------------------------ #
# ----- Visual Studio Code ----- #
# ------------------------------ #

wget -qO - https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo gpg --no-default-keyring --keyring /usr/share/keyrings/packages.microsoft.gpg --import
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

apt update
apt install code

# Install extensions
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.cpptools-themes
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension ms-vscode.cmake-tools
code --install-extension ms-dotnettools.csharp
code --install-extension GitHub.copilot

# -------------------------- #
# ----- GitHub Desktop ----- #
# -------------------------- #

wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'

apt update
apt install github-desktop

# ------------------- #
# ----- MakeMKV ----- #
# ------------------- #

# Install required packages
apt install -y build-essential pkg-config libc6-dev libssl-dev libexpat1-dev libavcodec-dev libgl1-mesa-dev qtbase5-dev zlib1g-dev

# Download Files
wget https://www.makemkv.com/download/makemkv-bin-1.17.3.tar.gz
wget https://www.makemkv.com/download/makemkv-oss-1.17.3.tar.gz

# Unzip Files and Remove tarballs
tar -xvvf makemkv-bin-1.17.3.tar.gz
tar -xvvf makemkv-oss-1.17.3.tar.gz
rm makemkv-bin-1.17.3.tar.gz
rm makemkv-oss-1.17.3.tar.gz

# Build OSS and BIN
cd makemkv-oss-1.17.3
chmod +x configure
./configure
make
make install
cd ../makemkv-bin-1.17.3
make
make install
cd ..

# Update icon cache for MakeMKV
gtk-update-icon-cache /usr/share/icons/hicolor

# Remove Directories
rm -r makemkv-oss-1.17.3
rm -r makemkv-bin-1.17.3

# ---------------------- #
# ----- VirtualBox ----- #
# ---------------------- #

wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg
sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian bullseye contrib" > /etc/apt/sources.list.d/virtualbox.list'

apt update
apt install -y virtualbox-7.0

wget https://download.virtualbox.org/virtualbox/7.0.0/Oracle_VM_VirtualBox_Extension_Pack-7.0.0.vbox-extpack
VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-7.0.0.vbox-extpack
rm Oracle_VM_VirtualBox_Extension_Pack-7.0.0.vbox-extpack

# ------------------------------- #
# ----- Setup GNOME Desktop ----- #
# ------------------------------- #

# Set GNOME tweaks settings
gsettings set org.gnome.desktop.wm.preferences button-layout 'icon:minimize,maximize,close'
gsettings set org.gnome.mutter center-new-windows true

# Enable extensions
gnome-extensions enable dash-to-dock@micxgx.gmail.com
gnome-extensions enable apps-menu@gnome-shell-extensions.gcampax.github.com

# Setup for each user desktop
USERS=$(cut -d: -f1,6 /etc/passwd | awk -F: '$2 ~ /^\/home/ { print $1 }')
for USER in $USERS; do

    # ------------------------------- #
    # ----- Download Wallpapers ----- #
    # ------------------------------- #
    
    # Set variables
    WALLPAPERDIR="/home/$USER/Pictures/Wallpapers"
    WEBAGENT="Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0"
    
    # Make directory
    mkdir $WALLPAPERDIR
    
    # Download wallpapers
    wget -U $WEBAGENT -P $WALLPAPERDIR --referer="https://www.uhdpaper.com/2023/02/sports-car-futuristic-mountain-4k-5370i.html" -O sports-car-futuristic-mountain-sunset.jpg "https://image-0.uhdpaper.com/wallpaper/sports-car-futuristic-mountain-sunset-scenery-digital-art-4k-wallpaper-uhdpaper.com-537@0@i.jpg"
    wget -U $WEBAGENT -P $WALLPAPERDIR --referer="https://www.uhdpaper.com/2023/06/angry-cat-4k-6881k.html" -O angry-cat.jpg "https://image-1.uhdpaper.com/wallpaper/angry-cat-digital-art-4k-wallpaper-uhdpaper.com-688@1@k.jpg"
    wget -U $WEBAGENT -P $WALLPAPERDIR --referer="https://www.uhdpaper.com/2023/06/mount-fuji-cherry-blossom-4k-6801k.html" -O mount-fuji-cherry-blossom-scenery-anime-art.jpg "https://image-1.uhdpaper.com/wallpaper/mount-fuji-cherry-blossom-scenery-anime-art-4k-wallpaper-uhdpaper.com-680@1@k.jpg"
    wget -U $WEBAGENT -P $WALLPAPERDIR --referer="https://www.uhdpaper.com/2022/11/night-snow-mountain-sky-stars-4k-4820h.html" -O night-snow-mountain-sky-stars.jpg "https://image-0.uhdpaper.com/wallpaper/night-snow-mountain-sky-stars-scenery-4k-17796-4k-wallpaper-uhdpaper.com-482@0@h.jpg"
    wget -U $WEBAGENT -P $WALLPAPERDIR --referer="https://www.uhdpaper.com/2023/06/sunset-starry-sky-planet-4k-6791k.html" -O sunset-starry-sky-planet-scenery.jpg "https://image-1.uhdpaper.com/wallpaper/sunset-starry-sky-planet-scenery-4k-wallpaper-uhdpaper.com-679@1@k.jpg"
    wget -U $WEBAGENT -P $WALLPAPERDIR --referer="https://www.uhdpaper.com/2023/04/mountain-sky-scenery-4k-7730i.html" -O mountain-sky-scenery-digital-art.jpg "https://image-0.uhdpaper.com/wallpaper/mountain-sky-scenery-digital-art-4k-wallpaper-uhdpaper.com-773@0@i.jpg"
    wget -U $WEBAGENT -P $WALLPAPERDIR --referer="https://www.uhdpaper.com/2023/06/optimus-prime-transformers-rise-4k-7311k.html" -O optimus-prime-transformers.jpg "https://image-1.uhdpaper.com/wallpaper/optimus-prime-transformers-rise-of-the-beasts-poster-4k-wallpaper-uhdpaper.com-731@1@k.jpg"
    wget -U $WEBAGENT -P $WALLPAPERDIR -O the-flash.jpg https://uhdwallpapers.org/download/the-flash-2023_945774/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O czinger-21c.jpg https://uhdwallpapers.org/download/czinger-21c_579497/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O lamborghini-aventadors-roadster.jpg https://uhdwallpapers.org/download/lamborghini-aventador-s-roadster_666844/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O ferrari-portofino.jpg https://uhdwallpapers.org/download/ferrari-portofino_48599/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O spider-man-no-way-home.jpg https://uhdwallpapers.org/download/spider-man-no-way-home_945945/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O godzilla-vs-kong.jpg https://uhdwallpapers.org/download/godzilla-vs-kong_664994/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O henry-cavil-in-the-witcher.jpg https://uhdwallpapers.org/download/henry-cavli-in-the-witcher_899567/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O captain-marvel-poster.jpg https://uhdwallpapers.org/download/captain-marvel-poster_787798/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O jurassic-world-fallen-kingdom.jpg https://uhdwallpapers.org/download/jurassic-world-fallen-kingdom-2018_65769/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O audi-e-bike.jpg https://uhdwallpapers.org/download/audi-e-bike_664649/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O ray-ban-sunglasses-on-hot-sand-beach.jpg https://uhdwallpapers.org/download/ray-ban-sunglasses-on-hot-sand-beach_94744/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O girl-practicing-martial-arts.jpg https://uhdwallpapers.org/download/girl-practicing-martial-arts_46485/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O the-football-ball-is-on-fire.jpg https://uhdwallpapers.org/download/the-football-ball-is-on-fire_47649/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O surf-board-on-the-beach.jpg https://uhdwallpapers.org/download/surf-board-on-the-beach_64469/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O windows-365-blue-cubes.jpg https://uhdwallpapers.org/download/windows-365-blue-cubes_945484/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O kapitan-borchardt-sailing-ship.jpg https://uhdwallpapers.org/download/kapitan-borchardt-sailing-ship-on-baltic-sea_574855/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O shanghai-iconic-view.jpg https://uhdwallpapers.org/download/shanghai-iconic-view_897868/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O spider-man-miles-morales.jpg https://uhdwallpapers.org/download/spider-man-miles-morales_476775/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O giza-plateau-pyramid-of-khufu.jpg https://uhdwallpapers.org/download/giza-plateau-pyramid-of-khufu_894997/3840x2160/
    wget -U $WEBAGENT -P $WALLPAPERDIR -O polar-bears-mother-and-cub.jpg https://uhdwallpapers.org/download/polar-bears-mother-and-cub_95595/3840x2160/
    
    # ------------------------- #
    # ----- Set wallpaper ----- #
    # ------------------------- #
    
    gsettings set org.gnome.desktop.background picture-uri "file:///$WALLPAPERDIR/sports-car-futuristic-mountain-sunset.jpg"
    
    # ----------------------------------------------- #
    # ----- Set dash-to-dock extension settings ----- #
    # ----------------------------------------------- #
    
    SCHEMADIR="/home/$USER/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/"
    gsettings --schemadir $SCHEMADIR set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
    gsettings --schemadir $SCHEMADIR set org.gnome.shell.extensions.dash-to-dock extend-height true
    gsettings --schemadir $SCHEMADIR set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 36
    gsettings --schemadir $SCHEMADIR set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
    gsettings --schemadir $SCHEMADIR set org.gnome.shell.extensions.dash-to-dock animate-show-apps false
    gsettings --schemadir $SCHEMADIR set org.gnome.shell.extensions.dash-to-dock show-trash true
    gsettings --schemadir $SCHEMADIR set org.gnome.shell.extensions.dash-to-dock show-mounts false
    gsettings --schemadir $SCHEMADIR set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
    gsettings --schemadir $SCHEMADIR set org.gnome.shell.extensions.dash-to-dock running-indicator-style 'SEGMENTED'
    gsettings --schemadir $SCHEMADIR set org.gnome.shell.extensions.dash-to-dock unity-backlit-items false
    gsettings --schemadir $SCHEMADIR set org.gnome.shell.extensions.dash-to-dock running-indicator-dominant-color true
    gsettings --schemadir $SCHEMADIR set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots false
    
done

# Use the following to list keys and current values of dash-to-dock extension **** change <user> to the actual users directory name ****
#   gsettings --schemadir /home/<user>/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/ list-recursively org.gnome.shell.extensions.dash-to-dock

gsettings set org.gnome.shell favorite-apps "['firefox-esr.desktop', 'thunderbird.desktop', 'org.gnome.Terminal.desktop', 'code.desktop', 'org.qt-project.qtcreator.desktop', 'org.kde.kate.desktop', 'SciTE.desktop', 'org.gnome.gedit.desktop', 'github-desktop.desktop', 'cmake-gui.desktop', 'libreoffice-writer.desktop', 'rhythmbox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Calendar.desktop', 'makemkv.desktop', 'org.bunkus.mkvtoolnix-gui.desktop', 'virtualbox.desktop', 'org.gnome.Software.desktop', 'gufw.desktop']"

# ------------------------ #
# ----- Install .NET ----- #
# ------------------------ #

wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

apt update
apt install -y dotnet-sdk-7.0 aspnetcore-runtime-7.0

# -------------------------- #
# ----- Download Icons ----- #
# -------------------------- #

# Initial Download
wget -P /usr/share/icons/breese/apps/48 -O codeblocks.svg https://upload.wikimedia.org/wikipedia/commons/b/bb/Breezeicons-apps-48-codeblocks.svg

# Copy to other directory's 
cp /usr/share/icons/breese/apps/48/codeblocks.svg /usr/share/icons/breeze-dark/apps/48/codeblocks.svg

# ----------------------- #
# ----- WE ARE DONE ----- #
# ----------------------- #

reboot

# ----------------- #
# ----- NOTES ----- #
# ----------------- #

# Linking Options:
# cURL:
# -lcurl

# MySQL Client:
# -lmysqlclient

# OpenSSL:
# -lssl -lcrypto

# OpenDKIM:
# -lopendkim
