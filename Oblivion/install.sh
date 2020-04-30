#This script was designed for a friend who installed manjaro i3. Use at your own discretion.

yay -S compton-rounded-corners rofi ranger nautilus ncmpcpp mpd vim i3lock-fancy firefox termite htop nitrogen polybar

rm ~/.zshrc
rm ~/.config/compton.conf
rm -rf ~/.config/termite
rm -rf ~/.config/gtk-3.0
rm -rf ~/.vim_runtime
rm -rf ~/.config/polybar
rm ~/.vimrc
rm -rf ~/.config/.i3
sudo rm /etc/xdg/dunstrc
sudo rm ~/.config/dunstrc

mv compton.conf ~/.config/
mv .zshrc ~/
mv .mpd ~/
mv .ncmpcpp ~/
mkdir ~/.i3
mv i3/* ~/.i3
mv polybar ~/.config
mv .vimrc ~/
mv .vim_runtime ~/
mv termite ~/.config
mv .profile ~/
mv gtk-3.0 ~/.config
mv .gtkrc-2.0 ~/
mv pi.zsh-theme ~/.oh-my-zsh/custom/themes
sudo mv dunstrc /etc/xdg
sudo mv fonts/* /usr/share/fonts/TTF
sudo mv dracula.rasi /usr/share/rofi/themes

reboot
