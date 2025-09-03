#!/bin/sh

# See Luke Smith's sb-memory
#https://github.com/LukeSmithxyz/voidrice/blob/master/.local/bin/statusbar/sb-memory

#free --mebi | sed -n '2{p;q}' | awk '{printf (" %2.2fG/%2.2fG\n", ( $3 / 1000), ($2 / 1000))}'
free --mebi | sed -n '2{p;q}' | awk '{printf (" %2.2fG\n", ( $3 / 1024))}'
