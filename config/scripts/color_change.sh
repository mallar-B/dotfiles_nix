#!bin/bash


swww img $1

wal -i $1

sassc ~/.config/templates/waybar/waybar.scss ~/.config/templates/waybar/style.css

cp ~/.config/templates/waybar/style.css ~/.config/waybar/style.css

pkill waybar

waybar&
