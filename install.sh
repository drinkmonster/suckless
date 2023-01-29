#!/bin/bash
# Installer script for my suckless dotfiles.

echo "This script will install my minimal suckless dotfiles."
echo "This script should be used on Arch Linux/derivatives!!!!"
echo "The script will also prompt you to enter your password a few times"
sleep 3 
echo "Do you want a compositor? y/n"
read comp
echo "Installing git, rofi, pywal, and discord"
sudo pacman -Syu git rofi discord python-pywal
echo "Getting paru..."
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
echo "Installing Monocraft font..."
paru otf-monocraft
echo "Installing Spotify..."
paru spotify
if echo $comp = "y"; then
  echo "Installing picom-jonaburg..."
  paru picom-jonaburg
  mkdir ~/.config/picom/
  cp picom.conf ~/.config/picom/
fi

mkdir ~/.config/rofi
cp config.rasi ~/.config/rofi/

echo "Making suckless software..."
cd dmenu && sudo make clean install && cd ..
cd dwm && sudo make clean install && cd ..
cd slstatus && sudo make clean install && cd ..
cd st && sudo make clean install && cd ..

cp .xinitrc ~
