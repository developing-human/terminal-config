#!/bin/bash -e
# Cycles through available audio devices by processing pipewire dump json.

current_device_name=$(pw-dump | jq '.[] | select(.id==38) | .metadata[] | select(.key=="default.audio.sink") | .value.name')
echo "current device name: " $current_device_name

current_device_id=$(pw-dump | jq ".[] | select(.info.props.\"node.name\" == $current_device_name) | .id")
echo "current device id: " $current_device_id

all_current_device_ids=$(pw-dump | jq '.[] | select(.info.props."media.class"=="Audio/Sink") | .id')
echo "all current device ids" $all_current_device_ids

all_current_device_ids=($all_current_device_ids)

# map device id to index in all_current_device_ids
current_index=-1
for i in "${!all_current_device_ids[@]}"; do
    if [ "${all_current_device_ids[$i]}" -eq "$current_device_id" ]; then
        current_index=$i
        break
    fi
done

if [[ "$current_index" -lt 0 ]]; then
    echo "Error: current device not found in sink list" >&2
    exit 1
fi

# compute next device index, wrapping around
next_index=$(( (current_index + 1) % ${#all_current_device_ids[@]} ))

# convert index back into id
next_device_id=${all_current_device_ids[$next_index]}

echo "Switching default sink: $current_device_id -> $next_device_id"

wpctl set-default "$next_device_id"
