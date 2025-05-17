#!/bin/bash
# select random wallpaper from ~/Pictures/Backgrounds/ and gerneate colourscheme using wal.

BACKGROUNDS="$HOME/Pictures/Backgrounds/"

ls $BACKGROUNDS | sort -R | tail -n 1 | while read file; do
   PICPATH="${BACKGROUNDS}${file}"
   wal -i "$BACKGROUNDS/${file}" 2>&1 > /dev/null

   echo "preload = $PICPATH" > $HOME/.config/hypr/hyprpaper.conf
   echo "wallpaper = , $PICPATH" >> $HOME/.config/hypr/hyprpaper.conf
done
