# Dotfiles: Oblivion
This is my first Arch Linux Rice! This is my daily driver for Winter 2019 onwards, for the forseeable future. A great way to close out the decade!

## About
This is my first *real* rice, and I'm really proud of it, especially given my relative novice standing in the ricing community. This rice is meant to be adherent to the Dracula color scheme. Ergo, you won't have a problem finding application themes that match this rice. I've chosen to use as many terminal applications as possible in my rice, so that you end up with a much more coherent experience, while minimizing resource usage

## Details
* OS: Arch Linux
* DE: None
* WM: i3-gaps
* Compositor: picom (I lost my i3 version, so I added my bspwm version sorry :/)
* Bar: Polybar
* GTK Theme: Ant-Dracula
* Terminal: Termite + zsh + oh-my-zsh
* Fonts: Iosevka Custom Build from Elenapan (I patched it with the nerd fonts patcher too), Noto CJK, icomoon-feather

## Notes
* I've modded firefox using the userChrome legacy feature in firefox. Do this at your own risk (it's not super dangerous though)
* I'm using oh-my-zsh, the theme depends on that
* Polybar has some parameters configured for my X1 Carbon specifically, so you may choose to change those modules if it doesn't work.
* The i3 config contains a line for startup.sh at the bottom, which is specific per system. You need to write it yourself. However, I've chosen to include my own file, in the event
    you need somehting to reference.
* If you use the same config as me on Arch Linux, expect an idle RAM usage of under 400mb

## Preferred Applications
* Terminal: Termite
* File Manager: Ranger
* Music Player: NCMPCPP/MPD
* Browser: Firefox
* Editor: Neovim

## Dependencies
* `polybar`
* `i3-gaps`
* `rofi`
* `mpd`
* `ncmpcpp`
* `nvim`
* `picom`
* `firefox`
* `mpDris2`
* `playerctl`

## Special thanks
* I got the wallpaper off of reddit, i don't even know where I got it anymore 😅
* Firefox was modded from turing753's minimal-functional-fox firefox theme. I'm using the nightTab home page, which is also very easy to theme
* Thanks to adi1090x for the base termite and polybar themes.
* I can't thank sreehax enough for helping me get started with Arch. You're a peach :)


