stow -v -R -t ~ git
mkdir -p ~/.config/sxhkd
stow -v -R -t ~/.config/sxhkd sxhkd
mkdir -p ~/.config/polybar
stow -v -R -t ~/.config/polybar polybar
mkdir -p ~/.config/autorandr
stow -v -R -t ~/.config/autorandr autorandr
mkdir -p ~/.config/nvim
stow -v -R -t ~/.config/nvim nvim
mkdir -p ~/.config/alacritty
stow -v -R -t ~/.config/alacritty alacritty
mkdir -p ~/.config/bspwm
stow -v -R -t ~/.config/bspwm bspwm
mkdir -p ~/.config/rofi
stow -v -R -t ~/.config/rofi rofi
mkdir -p ~/.config/dunst
stow -v -R -t ~/.config/dunst dunst
mkdir -p ~/.config/wal
stow -v -R -t ~/.config/wal wal
mkdir -p ~/.config/btops
stow -v -R -t ~/.config/btops btops
mkdir -p ~/.config/dunst

mkdir -p ~/bin
stow -v -R -t ~/bin bin
stow -v -R -t ~ borg

stow -v -R -t ~/.config/systemd/user userservices

stow -v -R -t ~/.config/sound sound
stow -v -R -t ~ zsh
sudo stow -v -R -t /etc locale
sudo stow -v -R -t /etc pacman
sudo stow -v -R -t ~ x
sudo stow -v -R -t /etc/systemd/system services
sudo stow -v -R -t /etc/systemd/ systemd
sudo mkdir -p xorg.conf.d
sudo stow -v -R -t /etc/X11/xorg.conf.d xinput
sudo stow -v -R -t /etc/pacman.d/hooks pacmanhooks
sudo stow -v -R -t /etc mkinitcpio
sudo stow -v -R -t /etc/acpi/events acpi
