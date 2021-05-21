#!/bin/bash

declare -A ENTRIES=(
  [browser]="firefox"
  [editor]="gedit"
  [terminal]="x-terminal-emulator"
  [vpn]="vpnui"
)

CHOICE="$(printf "%s\n" "${!ENTRIES[@]}" | dmenu "$@")"
if [ "${CHOICE}" != "" ]; then
  if [ -v ENTRIES[${CHOICE}] ]; then
    exec "${ENTRIES[${CHOICE}]}"
  else
    exec i3-nagbar -m "Unknown input ${CHOICE}"
  fi
fi
