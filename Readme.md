# How to install
If the line starts with #, you must execute this command as root, if with $, then as the created user.
## Arch linux installation
1) Format the partitions
2) Install basic system
3) Chroot to installed linux
4) Create a user
5) Clone the repository to the created user's home directory
```bash
$ git clone https://github.com/HardDie/My_linux_settings ~/My_linux_settings --recursive
```
6) Install **stow**
## How to run scripts
Change directory to ~/My_linux_settings
```bash
$ cd ~/My_linux_settings
```
Creating symbolic links for all configuration files. After running this command you should see many symbolic links in the home directory and in the .config directory
```
$ ./makelinks.sh
```
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
Install the **yay** app
```bash
$ ./install_yay.sh
```
Install the necessary applications for the **sway** environment
```bash
$ ./check_sway.sh
```
The last thing you must do is to compile some applications:
- application for drawing information blocks in the status bar ( C )
- applications to keep track of an independent keyboard layout for each application on the system ( go )
```bash
$ cd ~/.my_scripts/.data/binary
$ make
```
