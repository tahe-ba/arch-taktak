#from backup 

#in ~
#	.ssh folder
#	.bashrc 
#	.alacritty.yml

#form .config folder
#	picom.conf
#	folder i3

ssh-add ~/.ssh/id_ed25519

#background picture ~/Pictures/wallpaper.jpg

yay -S bashtop visual-studio-code-bin mkinitcpio-numlock 
git clone https://github.com/nullgemm/ly.git
cd ly
make github
sudo make install
sudo systemctl enable ly.service
cd ..
ins rhythmbox arc-gtk-theme lxappearance breeze-icons ttf-font-awesome
ins picom alacritty xss-lock pamixer dmenu numlockx thunar acpilight flameshot
ins  i3-wm i3status i3-gaps xautolock feh 
yay -S i3lock-color

#sublime
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu sublime-text


# /etc/systemd/logind.conf
#power button anf lid switch

# /etc/default/grub
# add swap partition
#		GRUB_CMDLINE_LINUX="quiet resume=/dev/nvme0n1p2" 
# disable detect the other arch on sda
#		GRUB_OS_PROBER_SKIP_LIST="ce006034-1654-4927-95a1-7715237b8070@/dev/sda2"
#sudo grub-mkconfig -o /boot/grub/grub.cfg

# /etc/mkinitcpio.conf
#		HOOKS=(base udev resume autodetect numlock modconf block filesystems keyboard)
# sudo mkinitcpio -p linux

# powertop /etc/systemd/system/powertop.service
#[Unit]
#Description=Powertop tunings
#[Service]
#Type=oneshot
#ExecStart=/usr/bin/powertop --auto-tune
#[Install]
#WantedBy=multi-user.target

#sudo systemctl enable powertop.service


#/etc/udev/rules.d/99-lowbat.rules
# Suspend the system when battery level drops to 5% or lower
#SUBSYSTEM=="power_supply", ATTR{status}=="Discharging", ATTR{capacity}=="[0-5]", RUN+="/usr/bin/systemctl hibernate"
