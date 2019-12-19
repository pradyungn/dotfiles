# Dotfiles: Arch Linux Winter
This is my first Arch Linux Rice! This is (was) my daily driver for Winter 2019. A great way to close out the decade!

| Desktop | Firefox | Terminal | Rofi |
| --- | --- | --- |
| ![Screenshot](https://raw.githubusercontent.com/pradyungn/dotfiles/master/Arch-Winter/scrnshts/wal.png) | ![Screenshot](https://raw.githubusercontent.com/pradyungn/dotfiles/master/Arch-Winter/scrnshts/firefox.png) | ![Screenshot](https://raw.githubusercontent.com/pradyungn/dotfiles/master/Arch-Winter/scrnshts/terminal.png) | ![Screenshot](https://raw.githubusercontent.com/pradyungn/dotfiles/master/Arch-Winter/scrnshts/launcher.png) |

## About
This rice is meant to be adherent to the Dracula color scheme. Ergo, you won't have a problem finding application themes that match this rice. I've chosen to use as many terminal applications as possible in my rice, so that you end up with a more coherent color scheme.

## Details
* OS: Arch
* DE: None
* WM: i3
* Compositor: sdhand's rounded corners compton patch
* Bar: Polybar
* GTK Theme: Ant-Dracula
* Terminal: Termite + zsh
* Fonts: mononoki Nerd Font (Both regular and mono), Noto CJK, icomoon-feather

## Notes
* This is my first *real* rice, and I'm really proud of it, especially given my relative novice standing in the ricing community.
* I've modded firefox using the userChrome legacy feature in firefox. Do this at your own risk (it's not super dangerous though)
* I'm using oh-my-zsh, the theme depends on that
* Polybar has some parameters configured for my X1 Carbon specifically, so you may choose to change those modules if it doesn't work.
* The i3 config contains a line for startup.sh at the bottom, which is specific per system. You need to write it yourself.
* Since my startup.sh is not in the dotfiles, you'll have to write your own startup script for polybar.
* If you use the same config as me on Arch Linux, expect an idle RAM usage of under 400mb

## Special thanks
* The wallpaper came from u/Avahe, who made an edit of a very nice wallpaper on r/wallpaper
* Firefox was modded from turing753's minimal-functional-fox firefox theme. I'm using the nightTab home page, which is also very easy to theme
* Thanks to adi1090x for the base termite and polybar themes.
