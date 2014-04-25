#!/system/bin/sh

export PATH=/system/bin

# Set platform variables
soc_hwplatform=`cat /sys/devices/system/soc/soc0/hw_platform` 2> /dev/null
soc_hwid=`cat /sys/devices/system/soc/soc0/id` 2> /dev/null
soc_hwver=`cat /sys/devices/system/soc/soc0/platform_version` 2> /dev/null

log -t BOOT -p i "MSM target '$1', SoC '$soc_hwplatform', HwID '$soc_hwid', SoC ver '$soc_hwver'"

case "$1" in
#    "msm7630_surf" | "msm7630_1x" | "msm7630_fusion")
 #       case "$soc_hwplatform" in
#            "FFA" | "SVLTE_FFA")
#                # linking to surf_keypad_qwerty.kcm.bin instead of surf_keypad_numeric.kcm.bin so that
#                # the UI keyboard works fine.
# ##               ln -s  /system/usr/keychars/surf_keypad_qwerty.kcm.bin /system/usr/keychars/surf_keypad.kcm.bin
#                ;;
#            "Fluid")
#                setprop ro.sf.lcd_density 240
#                setprop qcom.bt.dev_power_class 2
#                ;;
#            *)
#                ln -s  /system/usr/keychars/surf_keypad_qwerty.kcm.bin /system/usr/keychars/surf_keypad.kcm.bin
#                ;;
#        esac
#        ;;
#
#   "msm8660")
#        case "$soc_hwplatform" in
#            "Fluid")
#                setprop ro.sf.lcd_density 240
#                ;;
#            "Dragon")
#                setprop ro.sound.alsa "WM8903"
#                ;;
#        esac
#        ;;
#
#    "msm8960")
#        # lcd density is write-once. Hence the separate switch case
# #       case "$soc_hwplatform" in
#            "Liquid")
#                if [ "$soc_hwver" == "196608" ]; then # version 0x30000 is 3D sku
#                    setprop ro.sf.hwrotation 90
#                fi
#
#                setprop ro.sf.lcd_density 160
#                ;;
#            "MTP")
#                setprop ro.sf.lcd_density 240
#                ;;
#            *)
# #               case "$soc_hwid" in
# #                   "109")
#                        setprop ro.sf.lcd_density 160
# #                       ;;
#                    *)
#                        setprop ro.sf.lcd_density 240
#                        ;;
#                esac
#            ;;
#        esac
#
#        #Set up composition type based on the target
#        case "$soc_hwid" in
#            87)
#                #8960
#                setprop debug.composition.type dyn
#                ;;
#            153|154|155|156|157|138)
#                #8064 V2 PRIME | 8930AB | 8630AB | 8230AB | 8030AB | 8960AB
#                setprop debug.composition.type c2d
 #               ;;
 #           *)
#        esac
#        ;;

    "msm8974")
        case "$soc_hwplatform" in
            "Liquid")
                setprop ro.sf.lcd_density 160
                # Liquid do not have hardware navigation keys, so enable
                # Android sw navigation bar
                setprop ro.hw.nav_keys 0
                ;;
            *)
                setprop ro.sf.lcd_density 320
                ;;
        esac
        ;;

#    "msm8226")
#        case "$soc_hwplatform" in
#            *)
#                setprop ro.sf.lcd_density 320
#                ;;
#        esac
#        ;;
#
#    "msm8610" | "apq8084")
#        case "$soc_hwplatform" in
#            *)
#                setprop ro.sf.lcd_density 240
#                ;;
#        esac
#        ;;
esac

# Setup HDMI related nodes & permissions
# HDMI can be fb1 or fb2
# Loop through the sysfs nodes and determine
# the HDMI(dtv panel)
for fb_cnt in 0 1
do
sys_file=/sys/class/graphics/fb$fb_cnt
dev_file=/dev/graphics/fb$fb_cnt
if [ -d "$sys_file" ]
then
value=`cat $sys_file/msm_fb_type`
    case "$value" in
            "dtv panel")
        chown system.graphics $file/hpd
        chown system.graphics $file/vendor_name
        chown system.graphics $file/product_description
        chmod 0664 $file/hpd
        chmod 0664 $file/vendor_name
        chmod 0664 $file/product_description
        chmod 0664 $file/video_mode
        chmod 0664 $file/format_3d
        # create symbolic link
        ln -s $dev_file /dev/graphics/hdmi
        # Change owner and group for media server and surface flinger
        chown system.system $file/format_3d;;
    esac
    fb_cnt=$(( $fb_cnt + 1))
fi
done