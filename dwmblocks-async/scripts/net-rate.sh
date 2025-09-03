#!/bin/sh

# See Luke Smith's Stuff
# https://github.com/LukeSmithxyz/voidrice/blob/master/.local/bin/statusbar/sb-nettraf

# Returns the change in the value since the last time it was run
update() {
  sum=0
  for arg; do
    read -r i <"$arg"
    sum=$((sum + i))
  done
  #cache='/dev/shm/net-rate-log'
  cache=${XDG_CACHE_HOME:-$HOME/.cache}/${1##*/}
  [ -f "$cache" ] && read -r old <"$cache" || old=0
  printf %d\\n "$sum" >"$cache"
  printf %d\\n $((sum - old))
}

# bytes since this script was last run
rx=$(update /sys/class/net/[ew]*/statistics/rx_bytes)
tx=$(update /sys/class/net/[ew]*/statistics/tx_bytes)

# the interval (in seconds) this script is running at
interval=5

# bytes / interval = bytes per-second
rx_s=$(($rx / $interval))
tx_s=$(($tx / $interval))

# Human-Readable (e.g. 24M)
rx_sh="$(numfmt --to=iec $rx_s)"
tx_sh="$(numfmt --to=iec $tx_s)"

# 2M/s is high download
high_down_sec=$((2 * 1024 * 1024))

# 64K/s is high upload
high_up_sec=$((64 * 1024))

if [ $rx_s -gt $high_down_sec ]; then
  down_icon=''
else
  down_icon=''
fi

if [ $tx_s -gt $high_up_sec ]; then
  up_icon=''
else
  up_icon=''
fi

printf "%4s%s %4s%s\n" $rx_sh $down_icon $tx_sh $up_icon
