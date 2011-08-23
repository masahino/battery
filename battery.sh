#!/bin/sh

#info=( `ioreg -w0 -l |grep LegacyBatteryInfo | tr '[\"\=\(\{\)\}\,|]' ' ' ` )
#capacity=${info[6]}
#current=${info[8]}
#percent=`expr 100 \* $current \/ $capacity`
#echo "${percent}%"

ioreg -n AppleSmartBattery  -r | \
awk '
$1~/MaxCapacity/ {max = $3}
$1~/CurrentCapacity/ {current = $3}
$1~/IsCharging/ {is_charging = $3}
$1~/TimeRemaining/ {remaining = $3}
END { 
	printf("%d%% ", 100 * current/max);
	if (is_charging == "No") 
		printf("(%d:%02d)", remaining/60, remaining % 60);
}'
