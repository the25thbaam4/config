#!/bin/bash

echo "Let's install the basic packages that we need and activate them..."

installer(){
  echo "updating the system and installing pakages..." 
  sudo pacman -Syu
  sleep 3
  # Audio and bluetooth   
  echo "Audio and Video"
  sudo pacman -S --needed pipewire sof-firmware alsa-ucm-conf alsa-firmware wireplumber pipewire-pulse \
    pipewire-audio pipewire-alsa bluez bluez-utils blueman xf86-video-intel intel-ucode \
    xorg xorg-xinit alsa-utils arandr 

  echo "Printer"
  sudo pacman -S --needed hplip cups simple-scan python-pyqt5 

  echo "Themes and Fonts"
  sudo pacman -S --needed lxappearance font-manager papirus-icon-theme deepin-gtk-theme deepin-icon-theme \
    deepin-sound-theme materia-gtk-theme ttf-dejavu-nerd ttf-hack-nerd ttf-jetbrains-mono-nerd\
    ttf-anonymouspro-nerd ttf-meslo-nerd ttf-font-awesome 

  echo "Internet"
  sudo pacman -S --needed networkmanager openvpn openconnect networkmanager-openvpn \
    networkmanager-openconnect network-manager-applet nm-connection-editor \
    dhcpcd netctl dialog net-tools 

  echo "Developer"
  sudo pacman -S --needed jdk-openjdk jre-openjdk docker pgcli postgresql git maven \
    ctags 


  echo "Files"
  sudo pacman -S --needed thunar gvfs gvfs-smb samba rofi 


  echo "Terminal and Tools"
  sudo pacman -S --needed alacritty zsh zsh-completions ranger bat exa npm rpm \
    ncdu fzf xclip feh neovim man-pages man-db reflector ufw copyq \
    exfat-utils python-pip xdg-utils syncthing firefox thunderbird \
    acpi cowsay
  }

  activate(){

  # if ! command -v nmcli &> /dev/null; then
  #   echo "Network Manager is not installed. Installing..."
  #   sudo pacman -Syu networkmanager --noconfirm
  # fi

# Check if Network Manager is running
if ! systemctl is-active --quiet NetworkManager; then
  echo "Starting Network Manager..."
  sudo systemctl start NetworkManager
fi

# Check if Network Manager is enabled
if ! systemctl is-enabled --quiet NetworkManager; then
  echo "Enabling Network Manager..."
  sudo systemctl enable NetworkManager
fi

echo "Network Manager is installed and activated."

# check if cups is activated
if ! systemctl is-enabled --quiet cups; then
  echo "Ensbling and starting cups"
  sudo systemctl enable --now cups 
fi 

if ! systemctl is-enabled --quiet bluetooth; then
  echo "Enabling and starting blueman service..."
  sudo systemctl enable --now bluetooth
fi

#if ! systemctl is-enabled --quiet syncthing@$USER; then
# echo "Enabling and starting syncthing service..."
 # sudo systemctl enable --now syncthing@$USER
#fi

if ! systemctl is-enabled --quiet docker; then
  echo "Enabling and starting docker service..."
  sudo systemctl enable --now docker
  # usermod -mG docker $USER
fi

echo "All services are started and enabled."


}

archi=$(uname -sm)
case "$archi" in 
  Linux\ *64) installer && activate;;
esac
