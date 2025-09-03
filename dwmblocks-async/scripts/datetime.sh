#!/bin/sh

# Time Icon
hour_12="$(date '+%I')"
hour_12_icon=" "
case $hour_12 in
"12") hour_12_icon="󱑊 " ;;
"01") hour_12_icon="󱐿 " ;;
"02") hour_12_icon="󱑀 " ;;
"03") hour_12_icon="󱑁 " ;;
"04") hour_12_icon="󱑂 " ;;
"05") hour_12_icon="󱑃 " ;;
"06") hour_12_icon="󱑄 " ;;
"07") hour_12_icon="󱑅 " ;;
"08") hour_12_icon="󱑆 " ;;
"09") hour_12_icon="󱑇 " ;;
"10") hour_12_icon="󱑈 " ;;
"11") hour_12_icon="󱑉 " ;;
"12") hour_12_icon="󱑊 " ;;
esac

printf "$hour_12_icon$(date '+%I:%M %p')  󰃭 $(date '+%a %b %d, %Y')\n"
