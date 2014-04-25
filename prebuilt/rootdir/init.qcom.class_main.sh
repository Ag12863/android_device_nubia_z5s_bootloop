#!/system/bin/sh
#
# start ril-daemon only for targets on which radio is present
#
baseband=`getprop ro.baseband`
multirild=`getprop ro.multi.rild`
dsds=`getprop persist.dsds.enabled`
netmgr=`getprop ro.use_data_netmgrd`
sgltecsfb=`getprop persist.radio.sglte_csfb`

case "$baseband" in
    "apq")
    setprop ro.radio.noril yes
    stop ril-daemon
esac

case "$baseband" in
    "msm" | "csfb" | "svlte2a" | "mdm" | "sglte" | "unknown")
    start qmuxd
    case "$baseband" in
        "svlte2a" | "csfb")
        start qmiproxy
        ;;
        "sglte")
        if [ "x$sgltecsfb" != "xtrue" ]; then
          start qmiproxy
        else
          setprop persist.radio.voice.modem.index 0
        fi
    esac
    case "$multirild" in
        "true")
         case "$dsds" in
             "true")
             start ril-daemon1
         esac
    esac
    case "$netmgr" in
        "true")
        start netmgrd
    esac
esac
