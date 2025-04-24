sudo apt update && sudo apt upgrade --no-install-recommends
sudo apt install sway firefox git --no-install-recommends

# packages (names can be diff)

sudo apt install sway git tmux pipewire pipewire-pulseaudio wireplumber pavucontrol xdg-desktop-portal xdg-desktop-portal-wlr waybar firefox alacritty chromium tmux git neovim ripgrep wl-clipboard thunar blueman swaylock swayidle  network-manager network-manager-openvpn network-manager-applet 

sudo apt install pipewire pipewire-pulseaudio wireplumber pavucontrol xdg-desktop-portal xdg-desktop-portal-wlr waybar firefox alacritty chromium tmux git neovim ripgrep wl-clipboard thunar blueman swaylock swayidle network-manager-applet NetworkManager-openvpn NetworkManager vlc obs-studio vlc-plugin-gstreamer vlc-plugin-ffmpeg keepassxc rclone cups cups-pdf dbus-daemon google-noto-color-emoji-fonts cups cups-pdf gutenprint-cups system-config-printer grim slurp wlr-randr wl-mirror --no-install-recommends

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
