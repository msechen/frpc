#! wget https://raw.githubusercontent.com/msechen/frpc/master/rdpinstall.sh
#! chmod +x rdpinstall.sh
#! ./rdpinstall.sh
#! /bin/bash
printf "Installing RDP Be Patience..." >&2
{
sudo useradd -m MSEWEB
sudo adduser MSEWEB sudo
echo 'MSEWEB:3389' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
sudo apt install --assume-yes xfce4 desktop-base xfce4-terminal 
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
sudo apt remove --assume-yes gnome-terminal
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y
sudo apt -y install obs-studio
sudo apt -y install firefox
sudo apt -y install qbittorrent
sudo apt install nload
sudo adduser MSEWEB chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Completed " >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
su - MSEWEB -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n'
printf 'Your SUDO Pasword is: 3389 \n'
