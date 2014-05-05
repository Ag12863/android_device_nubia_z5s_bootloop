# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

DEVICE_PACKAGE_OVERLAYS += device/zte/NX503A/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# GSM and CDMA
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \

# Custom init / uevent
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/rootdir/fstab.qcom:root/fstab.qcom \
    $(LOCAL_PATH)/prebuilt/rootdir/init.rc:root/init.rc \
    $(LOCAL_PATH)/prebuilt/rootdir/init.qcom.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/prebuilt/rootdir/init.poweroffcharge.rc:root/lpm.rc \
    $(LOCAL_PATH)/prebuilt/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc \
    $(LOCAL_PATH)/prebuilt/rootdir/init.target.rc:root/init.target.rc
#    $(LOCAL_PATH)/prebuilt/rootdir/init.nubia.rc:root/init.nubia.rc \

# USB function switching
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/rootdir/init.nubia.usb.rc:root/init.nubia.usb.rc
#    $(LOCAL_PATH)/prebuilt/rootdir/init.qcom.usb.rc:root/init.qcom.usb.rc \

# Qcom shell script
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/rootdir/init.nubia.sh:root/init.nubia.sh \
    $(LOCAL_PATH)/prebuilt/rootdir/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/prebuilt/rootdir/init.qcom.usb.sh:root/init.qcom.usb.sh

#    $(LOCAL_PATH)/prebuilt/rootdir/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
#    $(LOCAL_PATH)/prebuilt/rootdir/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
#   $(LOCAL_PATH)/prebuilt/rootdir/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
#    $(LOCAL_PATH)/prebuilt/rootdir/init.qcom.factory.sh:root/init.qcom.factory.sh \
##    $(LOCAL_PATH)/prebuilt/rootdir/init.qcom.ril.sh:root/init.qcom.ril.sh \
#    $(LOCAL_PATH)/prebuilt/rootdir/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh \

#    $(LOCAL_PATH)/prebuilt/rootdir/init.wireless_mac.sh:root/init.wireless_mac.sh

#
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/prebuilt/rootdir/res/images:root/init.nubia.sh \


# Recovery
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/recovery/init.recovery.qcom.rc:root/init.recovery.qcom.rc

# Post recovery script
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# Additional sbin stuff
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/prebuilt/rootdir/sbin/poweroffcharge:root/sbin/poweroffcharge
#    $(LOCAL_PATH)/prebuilt/rootdir/charger:root/charger \
#    $(LOCAL_PATH)/prebuilt/rootdir/sbin/security_boot_check:root/sbin/security_boot_check

# Audio configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/prebuilt/system/etc/snd_soc_msm/snd_soc_msm_Taiko:system/etc/snd_soc_msm/snd_soc_msm_Taiko

# BT
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/prebuilt/system/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

# FM Radio
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/prebuilt/system/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/etc/gps.conf:system/etc/gps.conf

# IPC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/etc/sec_config:system/etc/sec_config

# WPA supplicant config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/prebuilt/system/etc/wifi/wpa_supplicant_wcn.conf:system/etc/wifi/wpa_supplicant_wcn.conf

# Prima wifi config
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/prebuilt/system/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh
#    $(LOCAL_PATH)/prebuilt/system/etc/firmware/wlan/prima/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/prebuilt/system/etc/media_codecs.xml:system/etc/media_codecs.xml

# Key layouts and idc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/usr/idc/cyttsp4_mt.idc:system/usr/idc/cyttsp4_mt.idc \
    $(LOCAL_PATH)/prebuilt/system/usr/idc/zte_cap_touchscreen.idc:system/usr/idc/zte_cap_touchscreen.idc \
    $(LOCAL_PATH)/prebuilt/system/usr/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    $(LOCAL_PATH)/prebuilt/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Thermal monitor configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/etc/thermald-8974.conf:system/etc/thermald.conf \
    $(LOCAL_PATH)/prebuilt/system/etc/thermal-engine-8974.conf:system/etc/thermal-engine.conf

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/etc/sap.conf:system/etc/sap.conf

# Vold
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab

# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/vendor/lib/libmmcamera_cac_lib.so:system/vendor/lib/libmmcamera_cac_lib.so


# NFC Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/prebuilt/system/etc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/prebuilt/system/etc/nfcee_access_debug.xml
endif

PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# NFC Support
PRODUCT_PACKAGES += \
   libnfc \
   libnfc_jni \
   Nfc \
   Tag \
   com.android.nfc_extras \
   nfc.default

# Filesystem management tools
PRODUCT_PACKAGES += \
   e2fsck

# Audio
PRODUCT_PACKAGES += \
   audio_policy.msm8974 \
   audio.primary.msm8974 \
   audio.a2dp.default \
   audio.usb.default \
   audio.r_submix.default \
   libaudio-resampler \
   libalsa-intf \
   tinymix \
   libqcomvisualizer \
   libqcomvoiceprocessing \

# BT
#PRODUCT_PACKAGES += \
#   hci_qcomm_init

# Camera
PRODUCT_PACKAGES += \
   libxml2

# Camera wrapper
PRODUCT_PACKAGES += \
    camera.qcom

# QCOM Display
PRODUCT_PACKAGES += \
   hwcomposer.msm8974 \
   gralloc.msm8974 \
   copybit.msm8974 \
   libgenlock \
   libmemalloc \
   liboverlay \
   libqdutils \
   libtilerenderer \
#   libI420colorconvert

# Omx
PRODUCT_PACKAGES += \
   libOmxAacEnc \
   libOmxAmrEnc \
   libOmxCore \
   libOmxEvrcEnc \
   libOmxQcelp13Enc \
   libOmxVdec \
   libOmxVenc \
   libc2dcolorconvert \
   libOmxVdecHevc \
   libdashplayer \
   libdivxdrmdecrypt \
   libmm-omxcore \
   libstagefrighthw

# Extended media support
PRODUCT_PACKAGES += \
   qcmediaplayer

PRODUCT_BOOT_JARS += qcmediaplayer

# GPS
PRODUCT_PACKAGES += \
   gps.msm8974 \
   libloc_adapter \
   libloc_eng \
   libloc_api_v02 \
   libloc_ds_api \
   libloc_core \
   libizat_core \
   libgeofence \
   libgps.utils \
   flp.msm8974

# for off charging mode
PRODUCT_PACKAGES += \
    charger \
#    charger_res_images

# Power
PRODUCT_PACKAGES += \
   power.qcom

# Lights
PRODUCT_PACKAGES += \
   lights.msm8974

# USB
PRODUCT_PACKAGES += \
   com.android.future.usb.accessory

# WLAN
#PRODUCT_PACKAGES += \
#   wcnss_service \
#
#   libQWiFiSoftApCfg

# WLAN
PRODUCT_PACKAGES += \
   libnetcmdiface \
   libnl_2

# Qualcomm Random Numbers Generator
PRODUCT_PACKAGES += \
   qrngd \
   qrngp

PRODUCT_PACKAGES += \
   libemoji \

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
   ro.telephony.call_ring.multiple=0 \
   ro.telephony.ril_class=ZTEQualcommUiccRIL

# Time
PRODUCT_PROPERTY_OVERRIDES += \
   persist.timed.enable=true

# VIDC debug_levels
# 1:ERROR 2:HIGH 4:LOW 0:NOLOGS 7:AllLOGS
PRODUCT_PROPERTY_OVERRIDES += \
   vidc.debug.level=1

PRODUCT_PROPERTY_OVERRIDES += \
   ro.chipname=msm8974 \
   ro.sf.lcd_density=480 \

# OpenGL ES 3.0
PRODUCT_PROPERTY_OVERRIDES += \
   ro.opengles.version=196608 \
   debug.composition.type=c2d

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
   persist.audio.fluence.voicecall=true \
   persist.audio.dualmic.config=endfire

PRODUCT_PROPERTY_OVERRIDES += \
   af.resampler.quality=4 \
   audio.offload.buffer.size.kb=32 \
   audio.offload.gapless.enabled=true \
   av.offload.enable=true

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
   persist.radio.apm_sim_not_pwdn=1

#Upto 3 layers can go through overlays
PRODUCT_PROPERTY_OVERRIDES += \
   com.qc.hardware=true \
   debug.sf.hw=1 \
   debug.egl.hw=1 \
   persist.hwc.mdpcomp.enable=true \
   debug.mdpcomp.logs=0

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bt.hci_transport=smd

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0
#    wifi.supplicant_scan_interval=15

PRODUCT_PROPERTY_OVERRIDES += \
   ro.kernel.android.checkjni=0 \
   ro.com.google.clientidbase=android-zte \
   ro.com.google.clientidbase.ms=android-zte \
   ro.com.google.clientidbase.am=android-zte \
   ro.com.google.clientidbase.gmm=android-zte \
   ro.com.google.clientidbase.yt=android-zte

# Set default USB interface
PRODUCT_PROPERTY_OVERRIDES += \
   persist.sys.usb.config=mtp,adb

# Include NX503A-vendor
$(call inherit-product, vendor/zte/NX503A/NX503A-vendor.mk)

# OpenGL ES 3.0
$(call inherit-product, vendor/zte/qcom-common/qcom-common-vendor-330.mk)

