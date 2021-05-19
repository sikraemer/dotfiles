#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/dmenu-exec.inc.sh"

declare -A ENTRIES=(
  [browser]="firefox"
  [editor]="gedit"
  [terminal]="x-terminal-emulator"
  [vpn]="vpnui"
)

dmenu_exec ENTRIES
