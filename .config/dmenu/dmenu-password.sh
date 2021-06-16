#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/dmenu-exec.inc.sh"

declare -A ENTRIES=$(find ~/.password-store/ -name "*.gpg" -exec realpath "--relative-to=${HOME}/.password-store/" {} \; | cut -d'.' -f-1)

CHOICE="$(printf "%s\n" "${ENTRIES[@]}" | dmenu "$@")"
if [ "${CHOICE}" != "" ]; then
  sleep 0.5
  setxkbmap de
  # Read first line without linebreak
  pass show "${CHOICE}" | { IFS= read -r pass; printf %s "$pass"; } | xdotool type --clearmodifiers --file -
fi
