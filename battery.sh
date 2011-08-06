info=( `ioreg -w0 -l |grep LegacyBatteryInfo | tr '[\"\=\(\{\)\}\,|]' ' ' ` )
capacity=${info[6]}
current=${info[8]}
percent=`expr 100 \* $current \/ $capacity`
echo "${percent}%"
