#!/bin/bash

headphone_id=$(pacmd list-cards | sed -En "/^\s*index:/h;/device\.string = \"$1\"/{x;s/index: //;s/\s+//;p;q}")

if [ $# -eq 0 ]
then
    echo "Usage: $0 [device mac address]"
    exit 1
fi

if [ -z "$headphone_id" ]
then
    echo "Could not parse a device id for '$1' from pacmd output"
    exit 1
else
    $(pacmd set-card-profile $headphone_id a2dp_sink)
    exit 0
fi
