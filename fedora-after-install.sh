echo "[main]
install_weak_deps=False
gpgcheck=True
max_parallel_downloads=8" > /etc/dnf/dnf.conf

dnf update && dnf upgrade
sudo dnf install sway firefox git # for browsing

# sound and media
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf group upgrade core
dnf update && dnf upgrade
sudo dnf swap 'ffmpeg-free' 'ffmpeg' --allowerasing
sudo dnf install @multimedia @sound-and-video
sudo dnf upgrade @multimedia
sudo dnf install ffmpeg-libs libva libva-utils 
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld --allowerasing

# packages
sudo dnf install alsa-sof-firmware pipewire pipewire-pulseaudio wireplumber pavucontrol xdg-desktop-portal xdg-desktop-portal-wlr waybar firefox alacritty chromium tmux git neovim ripgrep wl-clipboard thunar blueman swaylock swayidle network-manager-applet NetworkManager-openvpn NetworkManager vlc obs-studio vlc-plugin-gstreamer vlc-plugin-ffmpeg keepassxc rclone cups cups-pdf dbus-daemon google-noto-color-emoji-fonts cups cups-pdf gutenprint-cups system-config-printer grim slurp wlr-randr wl-mirror 

# services
systemctl --user enable mpris-proxy
systemctl --user enable pipewire pipewire-pulse
systemctl enable cups
systemctl daemon-reload


# emojis priority
mkdir ~/.config/fontconfig && cp ./fonts.conf ~/.config/fontconfig/

# gnome i3-like keybindings
for i in {1..9}; do gsettings set "org.gnome.shell.keybindings" "switch-to-application-${i}" "[]" ; done
for i in {1..9}; do gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-$i" "['<Super>$i']" ; done
for i in {1..9}; do gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-$i" "['<Shift><Super>$i']" ; done 
