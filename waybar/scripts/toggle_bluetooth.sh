#!/bin/sh -e

if bluetoothctl show | grep -q "Powered: yes"; then
    bluetoothctl power off
else
    # occasionally the bluetooth controller gets into the state
    # PowerState: off-blocked, and this unblocks it.
    rfkill unblock 0
    bluetoothctl power on
fi
