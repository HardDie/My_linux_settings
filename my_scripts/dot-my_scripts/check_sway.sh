set -u

RED="\033[0;31m"
GRN="\033[0;32m"
BLU="\033[0;36m"
NC="\033[0m"

LIST=""

check_bin() {
	which $1 > /dev/null 2>/dev/null
	RES=$?
	if [[ $RES -eq 1 ]]; then
		if [[ $2 == '*' ]]; then
			echo -e "[$RED FAIL $NC]    Can't find '$1' bin, try install '${BLU}$1${NC}' packet: $3"
			LIST+=" "$1
		else
			echo -e "[$RED FAIL $NC]    Can't find '$1' bin, try install '${BLU}$2${NC}' packet: $3"
			LIST+=" "$2
		fi
	else
		echo -e "[$GRN  OK  $NC]    $1"
	fi
}

check_pkt() {
	COUNT=$(pacman -Qsq ^$1$ | wc -l)
	if [[ $COUNT -ne 1 ]]; then
		echo -e "[$RED FAIL $NC]    Can't find '$1' packet, try install '${BLU}$1${NC}' packet: $2"
			LIST+=" "$1
	else
		echo -e "[$GRN  OK  $NC]    $1"
	fi
}

echo "Wayland:"
check_bin "sway"     "*"            "Sway tiling window manager"
check_bin "swaybg"   "*"            "Setup wallpapers"
check_bin "swayidle" "*"            "Auto start command after timeout inactivity"
check_bin "mako"     "*"            "Notification server"
check_bin "grim"     "*"            "Screenshots"
check_bin "slurp"    "*"            "Select the part of screen"
check_bin "wl-copy"  "wl-clipboard" "Copy text to clipboard"
check_bin "waybar"   "*"            "Top bar"
check_bin "rofi"     "*"            "Application launcher"
check_bin "swaylock" "*"            "Lockscreen"
check_pkt "bemenu-wayland"          "Backend for bemenu app"
check_bin "bemenu"   "*"            "Choose Yes/No before exit"

echo "Fonts:"
check_pkt "powerline-fonts-git"     "Terminal and powerline font"

echo "Sound:"
check_bin "pulseaudio"         "*"          "Pulse server"
check_pkt "pulseaudio-alsa"                 "For mixed sound from different applications"
check_bin "pavucontrol"        "*"          "GUI mixer"
check_bin "pamixer"            "*"          "For show volume in tray"
check_bin "alsamixer"          "alsa-utils" "Console volume control"
check_bin "mpc"                "*"          "Display current song in tray"

echo "Legacy:"
check_bin "Xwayland" "xorg-xwayland" "Start X server"

echo "Tools:"
check_bin "jq"           "*"         "Command-line JSON parser"
check_bin "bc"           "*"         "Command-line calculator"
check_bin "iw"           "*"         "Command-line wireless utility"
check_bin "pamixer"      "*"         "Command-line volume controller"
check_pkt "python-i3ipc"             "Library for independent layout script"
check_pkt "brightnessctl"            "Control display backlight"
check_pkt "alacritty"                "Terminal"
check_bin "notify-send"  "libnotify" "Command-line notify utility"

if [[ $LIST ]]; then
	echo "Use:"
	echo "yay -S$LIST"
	echo

	echo -n "Do you want to install the required applications? [y/N]: "
	CONFIRM=""
	read CONFIRM
	if [[ $CONFIRM == 'y' || $CONFIRM == 'Y' ]]; then
		yay -S $LIST
	fi
fi
