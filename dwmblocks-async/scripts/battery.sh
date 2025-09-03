#!/bin/bash

charge_now=$(cat /sys/class/power_supply/BAT1/charge_now)
charge_full=$(cat /sys/class/power_supply/BAT1/charge_full)

# https://github.com/torvalds/linux/blob/7e6739b9336e61fe23ca4e2c8d1fda8f19f979bf/Documentation/ABI/testing/sysfs-class-power
# line 463
# Unknown, Full, Charging, Discharging, Not charging
stat=$(cat /sys/class/power_supply/BAT1/status)

stat_symbol=""

bat_stat_symbol() {
  # charge as an integer between 0-10
  charge=$((10 * $charge_now / $charge_full))
  case $charge in
  0) stat_symbol="󰂃" ;;
  1) stat_symbol="󰂃" ;;
  2) stat_symbol="󰁻" ;;
  3) stat_symbol="󰁼" ;;
  4) stat_symbol="󰁽" ;;
  5) stat_symbol="󰁾" ;;
  6) stat_symbol="󰁿" ;;
  7) stat_symbol="󰂀" ;;
  8) stat_symbol="󰂁" ;;
  9) stat_symbol="󰂂" ;;
  10) stat_symbol="󰁹" ;;
  esac
}

case $stat in
'Full') stat_symbol="󰁹" ;;
'Charging') stat_symbol="󱐋" ;;
'Discharging') bat_stat_symbol ;;
'Not charging') bat_stat_symbol ;;
'Unknown') stat_symbol="󱟩" ;;
*) stat_symbol="" ;;
esac

charge_pct=$((100 * $charge_now / $charge_full))
if [[ $charge_pct == 100 ]]; then
  charge_txt='100'
else
  charge_txt=$(printf "%d%%" $charge_pct)
fi

printf "%s %s\n" $stat_symbol $charge_txt
