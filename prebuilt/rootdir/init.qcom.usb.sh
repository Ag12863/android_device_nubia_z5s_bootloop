#!/system/bin/sh

serialno=`getprop persist.usb.serialno`
case "$serialno" in
    "")
    serialnum=`getprop ro.serialno`
    case "$serialnum" in
        "");; #Do nothing, use default serial number
        *)
        echo "$serialnum" > /sys/class/android_usb/android0/iSerial
    esac
    ;;
    *)
    echo "$serialno" > /sys/class/android_usb/android0/iSerial
esac

chown root.system /sys/devices/platform/msm_hsusb/gadget/wakeup
chmod 220 /sys/devices/platform/msm_hsusb/gadget/wakeup

#
# Allow persistent usb charging disabling
# User needs to set usb charging disabled in persist.usb.chgdisabled
#
target=`getprop ro.board.platform`
usbchgdisabled=`getprop persist.usb.chgdisabled`
case "$usbchgdisabled" in
    "") ;; #Do nothing here
    * )
    case $target in
        "msm8660")
        echo "$usbchgdisabled" > /sys/module/pmic8058_charger/parameters/disabled
        echo "$usbchgdisabled" > /sys/module/smb137b/parameters/disabled
	;;
        "msm8960")
        echo "$usbchgdisabled" > /sys/module/pm8921_charger/parameters/disabled
	;;
    esac
esac

usbcurrentlimit=`getprop persist.usb.currentlimit`
case "$usbcurrentlimit" in
    "") ;; #Do nothing here
    * )
    case $target in
        "msm8960")
        echo "$usbcurrentlimit" > /sys/module/pm8921_charger/parameters/usb_max_current
	;;
    esac
esac

if [ -f "/persist/property/persist.sys.usb.factory" ];then
	cat /persist/property/persist.sys.usb.factory | while read myline
	do
		case $myline in
			0)
				setprop persist.sys.usb.factory 0
			;;
			*)
				setprop persist.sys.usb.factory 1
			;;
		esac
		echo "LINE:"$myline
	done
else
	setprop persist.sys.usb.factory 1
fi

#
# Allow USB enumeration with default PID/VID
#
baseband=`getprop ro.baseband`
echo 1  > /sys/class/android_usb/f_mass_storage/lun/nofua
usb_config=`getprop persist.sys.usb.config`
build_type=`getprop ro.build.type`
case "$usb_config" in
    "" | "adb" | "none") #USB persist config not set, select default configuration
        case $target in
            "apq8084")
                setprop persist.sys.usb.config diag,adb
                ;;
            "msm8960" | "msm8974" | "msm8226" | "msm8610")
                case "$baseband" in
                    "msm")
                        case "$build_type" in
                            "eng")
                                setprop persist.sys.usb.config nubia,adb
                            ;;
                            *)
                                setprop persist.sys.usb.config nubia
                            ;;
                        esac
                    ;;
                    "mdm")
                         setprop persist.sys.usb.config diag,diag_mdm,serial_hsic,serial_tty,rmnet_hsic,mass_storage,adb
                    ;;
                    "sglte")
                         setprop persist.sys.usb.config diag,diag_qsc,serial_smd,serial_tty,serial_hsuart,rmnet_hsuart,mass_storage,adb
                    ;;
                    "dsda")
                         setprop persist.sys.usb.config diag,diag_mdm,diag_qsc,serial_hsic,serial_hsuart,rmnet_hsic,rmnet_hsuart,mass_storage,adb
                    ;;
                    *)
                         #setprop persist.sys.usb.config diag,serial_smd,serial_tty,rmnet_bam,mass_storage,adb
                         setprop persist.sys.usb.config nubia,adb
                    ;;
                esac
            ;;
            "msm7627a")
                setprop persist.sys.usb.config diag,serial_smd,serial_tty,rmnet_smd,mass_storage,adb
            ;;
            * )
                case "$baseband" in
                    "svlte2a")
                         setprop persist.sys.usb.config diag,diag_mdm,serial_sdio,serial_smd,rmnet_smd_sdio,mass_storage,adb
                    ;;
                    "csfb")
                         setprop persist.sys.usb.config diag,diag_mdm,serial_sdio,serial_tty,rmnet_sdio,mass_storage,adb
                    ;;
                    *)
                         setprop persist.sys.usb.config diag,serial_tty,serial_tty,rmnet_smd,mass_storage,adb
                    ;;
                esac
            ;;
        esac
    ;;
    * ) ;; #USB persist config exists, do nothing
esac

#
# Add support for exposing lun0 as cdrom in mass-storage
#
target=`getprop ro.product.device`
cdromname="/system/driver.iso"
echo $cdromname > /sys/class/android_usb/android0/f_mass_storage/lun0/file

#
# Select USB BAM - 2.0 or 3.0
#
case "$target" in
    "msm8974")
        echo ssusb > /sys/bus/platform/devices/usb_bam/enable
    ;;
esac

