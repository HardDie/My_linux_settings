# How to install
If the line starts with #, you must execute this command as root, if with $, then as the created user.
## Arch linux installation
1) Format the partitions
2) Install basic system
3) Chroot to installed linux
4) Create a user
5) Clone the repository to the created user's home directory (*you can use any other path and folder name, but in the example we will use the default name and home directory*)
```bash
$ git clone https://github.com/HardDie/My_linux_settings ~/My_linux_settings --recursive
```
6) Install **stow**
## How to run scripts
Change directory to ~/My_linux_settings
```bash
$ cd ~/My_linux_settings
```
### Create links
Creating symbolic links for all configuration files. After running this command you should see many symbolic links in the home directory and in the .config directory
```
$ ./makelinks.sh
```
### Initial system setup
Change directory to ~/.my_scripts
```bash
$ cd ~/.my_scripts
```
To configure your newly installed linux, run the first_setup.sh script. It will do the setup:
- locale
- timezone
- hostname
- multilibs for pacman
- switch pacman to color mode
- font for the vconsole
```
# ./first_setup.sh
```
### yay
Install the **yay** app
```bash
$ ./install_yay.sh
```
### sway
Install the necessary applications for the **sway** environment
```bash
$ ./check_sway.sh
```
### Status bar setup
The last thing you must do is to compile some applications:
- application for drawing information blocks in the status bar ( C )
- applications to keep track of an independent keyboard layout for each application on the system ( go )
```bash
$ cd ~/.my_scripts/.data/binary
$ make
```
## Additional configuration
### Wallpaper
If you don't have your own image for the wallpaper, you can use the default wallpaper.
```bash
$ mkdir ~/.wallpapers
$ cp /usr/share/backgrounds/sway/Sway_Wallpaper_Blue_1920x1080.png ~/.wallpapers/wallpaper.png
```
Or if you have a different screen size, you can see a list of all available wallpapers
```bash
$ yay -Ql sway | grep '.png'
```
### Status bar
Currently swaybar has one problem, the path to the startup script must be full, the relative path does not work.
You must change the path in ~/.config/sway/config in the bar section to your username.
This section looks like this:
```
bar {
    swaybar_command /home/harddie/.config/sway/start_waybar.sh
}
```
