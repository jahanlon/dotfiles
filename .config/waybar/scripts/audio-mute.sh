SINK="$(pactl list short sinks | grep -i running | cut -f1)"
pactl set-sink-mute $SINK toggle
