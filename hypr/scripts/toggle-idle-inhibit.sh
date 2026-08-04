#!/usr/bin/env bash
LOCKFILE="$HOME/.cache/hypridle_inhibit.lock"

if [ -f "$LOCKFILE" ]; then
    rm -f "$LOCKFILE"
    notify-send -u low "Mise en veille" "Réactivée" -i weather-clear-night
else
    touch "$LOCKFILE"
    notify-send -u low "Mise en veille" "Désactivée (verrou actif)" -i weather-clear
fi

# Force Waybar à rafraîchir le module tout de suite
pkill -RTMIN+8 waybar
