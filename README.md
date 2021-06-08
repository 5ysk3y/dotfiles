# dotfiles

Herein lies my most used/maintained Linux configuration files; most conform to the [XDG Specification](https://wiki.archlinux.org/title/XDG_Base_Directory) so dropping them into most setups should work-- famous last words. My configurations namely revolve around using vim-style keybindings in applications that are setup to use the Dracula theme/colour-scheme, so please factor this in before you use.

These are not specific to hacking and are namely here for myself as a backup with subsequent version control; I'm making them public in case they are of use to anyone else. I also cannot offer support for any issues you may/may not experience.

### Fonts

Please enusre you have the following fonts included for a smooth setup-- I've noted the respective package names relative to the `Arch` distro. Some of these may be different if you're running another flavor of Linux:

- *Terminus* (terminus-font via community repo)
- *Font Awesome* (otf-font-awesome via community repo)
- *Source Code Pro* (adobe-source-code-pro-fonts via extra repo)
- *Tamzen* (tamzen-font-git via aur repo)

### Usage

This is designed to be used with [GNU Stow](https://www.gnu.org/software/stow/) in the following manner:

`stow -vt ~ */`

This will configure these files from your home directory (~) but you can change that if you wish by changing the above command. I advise reading up on the usage of `stow` if you are unfamiliar, as well as backing up your own configuration files before you do anything with mine.

***

### Applications

Here are a list of the current applications I use (other config files may be also added to this repo over time):

- *Compositor:* [Sway](https://github.com/swaywm/sway) / [Wayland](https://github.com/wayland-project/wayland)
- *Notifications:* [Dunst](https://github.com/dunst-project/dunst) (until I migrate to [fnott](https://gitlab.com/dnkl/fnott))
- *Bar:* [Waybar](https://github.com/Alexays/Waybar)
- *Menu:* [Wofi](https://hg.sr.ht/~scoopta/wofi)
- *Shell:* [Alacritty](https://github.com/alacritty/alacritty) / zsh
- *Browser:* [Qutebrowser](https://github.com/qutebrowser/qutebrowser)

### Screenshot

![image](https://user-images.githubusercontent.com/62815243/120772614-65a2ff00-c518-11eb-896a-a9843a057b83.png)
