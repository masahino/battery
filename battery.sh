#!/bin/sh

#info=( `ioreg -w0 -l |grep LegacyBatteryInfo | tr '[\"\=\(\{\)\}\,|]' ' ' ` )
#capacity=${info[6]}
#current=${info[8]}
#percent=`expr 100 \* $current \/ $capacity`
#echo "${percent}%"

ioreg -n AppleSmartBattery  -r | \
awk 'BEGIN{FS="="; max = 0; current = 0;}
$1~/MaxCapacity/ {max = $2}
$1~/CurrentCapacity/ {current = $2}
END { printf("%d%%", 100 * current/max); }'
