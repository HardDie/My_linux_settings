#!/bin/bash

echo start waybar $@ >> /home/harddie/bar.log
waybar -c ~/.config/sway/waybar.conf -s ~/.config/sway/style.css
