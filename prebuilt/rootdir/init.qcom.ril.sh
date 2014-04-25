#!/system/bin/sh

#
# start two rild when dsds property enabled
#
multisim=`getprop persist.multisim.config`
if [ "$multisim" = "dsds" ] || [ "$multisim" = "dsda" ]; then
    setprop ro.multi.rild true
    stop ril-daemon
    start ril-daemon
    start ril-daemon1
fi
