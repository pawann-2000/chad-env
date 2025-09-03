#!/bin/sh

muted="$(pamixer --get-mute)"
if [ $muted != "false" ]; then
  printf " Muted\n"
else
  volume="$(pamixer --get-volume)"
  if [ $volume -gt 50 ]; then
    printf " $volume%%\n"
  elif [ $volume -gt 30 ]; then
    printf " $volume%%\n"
  elif [ $volume -gt 10 ]; then
    printf " $volume%%\n"
  else
    printf " $volume%%\n"
  fi
fi
