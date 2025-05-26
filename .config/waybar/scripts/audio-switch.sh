PHONES="$(pactl list short sinks | grep -i fiio | cut -f1)"
SPEAKERS="$(pactl list short sinks | grep -i hdmi | cut -f1)"

if pactl get-default-sink | grep -i hdmi > /dev/null; then
  pactl set-default-sink $PHONES  
else
  pactl set-default-sink $SPEAKERS
fi

