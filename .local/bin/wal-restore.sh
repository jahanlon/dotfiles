#!/bin/bash
# select random wallpaper from ~/Pictures/Backgrounds/ and gerneate colourscheme using wal.

BACKGROUNDS="$HOME/Pictures/Backgrounds/"

ls $BACKGROUNDS | sort -R | tail -n 1 | while read file; do
   PICPATH="${BACKGROUNDS}${file}"
   wal -i "$BACKGROUNDS/${file}" > /dev/null 2>&1

   echo "preload = $PICPATH" > $HOME/.config/hypr/hyprpaper.conf
   echo "wallpaper = , $PICPATH" >> $HOME/.config/hypr/hyprpaper.conf
done

pidof hyprpaper > /dev/null
if [ $? -eq 0 ]; then
  killall hyprpaper 
  hyprpaper 2>&1 > /dev/null & disown 
fi

cp $HOME/.cache/wal/colors-waybar.css $HOME/.config/waybar/

killall waybar
hyprctl dispatch exec waybar

