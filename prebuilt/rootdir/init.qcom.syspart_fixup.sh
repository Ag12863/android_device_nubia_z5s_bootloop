#!/system/bin/sh

target="$1"
serial="$2"

# No path is set up at this point so we have to do it here.
PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

mount_needed=false;

if [ ! -f /system/etc/boot_fixup ];then
# This should be the first command
# remount system as read-write.
  mount -o rw,remount,barrier=1 /system
  mount_needed=true;
fi

# **** WARNING *****
# This runs in a single-threaded, critical path portion
# of the Android bootup sequence.  This is to guarantee
# all necessary system partition fixups are done before
# the rest of the system starts up.  Run any non-
# timing critical tasks in a separate process to
# prevent slowdown at boot.

# Run modem link script
if [ -f /system/etc/init.qcom.modem_links.sh ]; then
  /system/bin/sh /system/etc/init.qcom.modem_links.sh
fi

# Run mdm link script
if [ -f /system/etc/init.qcom.mdm_links.sh ]; then
  /system/bin/sh /system/etc/init.qcom.mdm_links.sh
fi

# Run thermal script
if [ -f /system/etc/init.qcom.thermal_conf.sh ]; then
  /system/bin/sh /system/etc/init.qcom.thermal_conf.sh
fi

# Run wifi script
if [ -f /system/etc/init.qcom.wifi.sh ]; then
  /system/bin/sh /system/etc/init.qcom.wifi.sh "$target" "$serial"
fi

# Run the sensor script
if [ -f /system/etc/init.qcom.sensor.sh ]; then
  /system/bin/sh /system/etc/init.qcom.sensor.sh
fi

# Run usf script
if [ -f /system/etc/usf_settings.sh ]; then
  /system/bin/sh /system/etc/usf_settings.sh
fi

touch /system/etc/boot_fixup

if $mount_needed ;then
# This should be the last command
# remount system as read-only.
  mount -o ro,remount,barrier=1 /system
fi
