#!/bin/bash

bose_a2dp() {
    headphone_id=$(pacmd list-cards | sed -En '/^\s*index:/h;/device\.description = ".+Bose QC35 II"/{x;s/index: //;s/\s+//;p;q}')

    if [ -z "$headphone_id" ]
    then
        echo "Could not parse an id for '.+Bose QC35 II' from pacmd output"
        return 1
    else
        $(pacmd set-card-profile $headphone_id a2dp_sink)
    fi
}
