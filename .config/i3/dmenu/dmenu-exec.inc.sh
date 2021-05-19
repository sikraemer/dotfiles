#!/bin/bash

readonly _DMENU_PARAMETERS=("$@")

function dmenu_exec() {
  local -r -n _ENTRIES=$1
  shift
  local _CHOICE="$(printf "%s\n" "${!_ENTRIES[@]}" | dmenu "${_DMENU_PARAMETERS[@]}")"
  if [ "${_CHOICE}" != "" ]; then
    if [ -v ENTRIES[${_CHOICE}] ]; then
      exec "${_ENTRIES[${_CHOICE}]}"
    else
      exec i3-nagbar -m "Unknown input ${_CHOICE}"
    fi
  fi
}

