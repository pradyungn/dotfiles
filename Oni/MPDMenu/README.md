# MPD Menu

I use a script called "mpc_rof" in my sxhkdrc, and the executable is located in ~/.config/bspwm/scripts. It's a rofi-based menu that I made to act like a HUD for MPD - the mpc and
rof terms derive from the fact that I use "MPC" and "Rofi" - it made more sense in my head at the time. The script itself doesn't have any dependencies except for MPC and Rofi.
However, please note that it takes advantage of the tmux-mode compatibility that I have built into the rest of my rofi-based helpers and tools, so there's a hardcoded file path
where the program reads in the Y-offset. Replace this path with YOUR own "height" file's path, or just hardcode the Y offset.
