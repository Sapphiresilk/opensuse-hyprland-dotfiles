#!/bin/bash
notify ()
{
  notify-send "Checking for updates..."
  notify-send "Updates checked: zypper has $(zypper lu | wc -l) new package(s), flatpak has $(flatpak remote-ls --updates | wc -l) new package(s), brew has $(brew outdated --quiet | wc -l) new package(s). Consider updating sometimes btw. You use openSUSE btw so mind taking manual snapshots before full system upgrade. Have fun and nice work! Dmitry Goryachev, SUSE team"
}
sleep 60
notify # at boot

while true; do # periodically
  sleep $(echo "60*60*4" | bc)
  notify
done

