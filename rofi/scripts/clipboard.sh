#!/usr/bin/env bash
# Mode script rofi pour l'historique du presse-papiers (cliphist).
# Sans argument : affiche la liste. Avec argument (ligne sélectionnée) :
# décode l'entrée choisie et la remet dans le presse-papiers (wl-copy).
# Protocole "script mode" de rofi : https://davatorium.github.io/rofi/1.7.3/rofi-script.5/

if [[ -n "$1" ]]; then
	cliphist decode <<<"$1" | wl-copy
	exit 0
fi

cliphist list
