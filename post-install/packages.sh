sudo apt update && sudo apt upgrade --no-install-recommends
sudo apt install sway firefox git --no-install-recommends

# packages (names can be diff)

sudo apt install sway git tmux pipewire pipewire-pulseaudio wireplumber pavucontrol xdg-desktop-portal xdg-desktop-portal-wlr waybar firefox-esr alacritty chromium tmux git ripgrep wl-clipboard thunar blueman swaylock swayidle network-manager network-manager-openvpn network-manager-applet keepassxc rclone dbus-daemon fonts-noto-color-emoji-noto-color-emoji-fonts cups printer-driver-gutenprint system-config-printer grim slurp wlr-randr wl-mirror

# services
systemctl --user enable --now wireplumber xdg-desktop-portal xdg-desktop-portal-wlr pipewire pipewire-pulse mpris-proxy
systemctl enable cups 
systemctl daemon-reload


# emojis priority
mkdir ~/.config/fontconfig && cp ./fonts.conf ~/.config/fontconfig/

gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 9
for i in {1..9}; do
  gsettings set "org.gnome.shell.keybindings" "switch-to-application-${i}" "[]"
  gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-${i}" "['<Super>${i}']"
  gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-${i}" "['<Super><Shift>${i}']"
  gsettings set "org.gnome.shell.extensions.dash-to-dock" "app-hotkey-${i}" "[]"
done

gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Shift>Alt_L']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Shift>Alt_L']"
