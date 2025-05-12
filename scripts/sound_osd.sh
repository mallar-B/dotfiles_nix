#!/bin/sh

get_default_sink() {
    pactl get-default-sink
}

get_volume() {
    local sink="$1"
    pactl get-sink-volume "$sink" | grep -oP '\d+%' | head -1
}

LAST_VOL=""
NOTIFY_ID=9999

send_notification() {
    local new_vol="$1"
    NOTIFY_ID=$(notify-send -p -r "$NOTIFY_ID" \
        --hint=int:transient:1 \
        --expire-time=1000 \
        "🔊 Volume Changed" "Current volume: $new_vol")
}

pactl subscribe | grep --line-buffered "Event 'change' on sink" | while read -r _; do
    CURRENT_SINK=$(get_default_sink)
    NEW_VOL=$(get_volume "$CURRENT_SINK")
    if [[ "$NEW_VOL" != "$LAST_VOL" ]]; then
        send_notification "$NEW_VOL"
        LAST_VOL=$NEW_VOL
    fi
done


