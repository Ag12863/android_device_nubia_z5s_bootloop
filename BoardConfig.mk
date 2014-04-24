# inherit from the proprietary version
-include vendor/zte/NX503A/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH := device/zte/NX503A/include

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Assert
TARGET_OTA_ASSERT_DEVICE := NX503A,nx503a,Z5S,z5s
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/zte/NX503A/releasetools/zte_ota_from_target_files

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330
TARGET_BOOTLOADER_BOARD_NAME := MSM8974

# ZTE Platform
BOARD_VENDOR_PLATFORM := nubia

BOARD_LIB_DUMPSTATE := libdumpstate.zte

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

# Partition information
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1288488960
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2684354560
BOARD_FLASH_BLOCK_SIZE := 131072

# Vold
BOARD_VOLD_MAX_PARTITIONS := 26
#TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/msm_dwc3/f9200000.dwc3/gadget/lun%d/file"

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET      := true
TARGET_KRAIT_BIONIC_PLDOFFS   := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH  := 64
TARGET_KRAIT_BIONIC_PLDSIZE   := 64

# Kernel information
TARGET_KERNEL_CONFIG := msm8974-NX503A_defconfig
#TARGET_KERNEL_CONFIG := cm_NX503A_defconfig
TARGET_KERNEL_SOURCE := kernel/zte/NX503A
#TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000

BOARD_KERNEL_SEPARATED_DT := true

# Audio
TARGET_USES_QCOM_COMPRESSED_AUDIO := true
#TARGET_QCOM_AUDIO_VARIANT := caf
TARGET_QCOM_AUDIO_VARIANT := bfam
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
QCOM_AUDIO_FEATURE_DISABLED_FLUENCE := true
QCOM_AUDIO_FEATURE_DISABLED_SSR := true
QCOM_AUDIO_FEATURE_DISABLED_ADSP_SSR := true
QCOM_AUDIO_FEATURE_DISABLED_FM := true
QCOM_AUDIO_FEATURE_DISABLED_WFD := true
QCOM_AUDIO_FEATURE_DISABLED_PROXY_DEVICE := true
QCOM_AUDIO_FEATURE_DISABLED_MULTICHANNELS := true
#QCOM_AUDIO_FEATURE_DISABLED_TUNNEL_LPA := true

COMMON_GLOBAL_CFLAGS += -DDOLBY_DAP -DQCOM_DS1_DOLBY_DAP -DLPA_DEFAULT_BUFFER_SIZE=512


# Bluetoth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
#BOARD_HAVE_BLUETOOTH_BCM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/zte/NX503A/bluetooth

# Camera
# no have camera hal
USE_CAMERA_STUB := true
#USE_CAMERA_STUB := false
#TARGET_PROVIDES_CAMERA_HAL := true
#COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# Display
TARGET_QCOM_DISPLAY_VARIANT := mdss
#TARGET_QCOM_DISPLAY_VARIANT := caf
TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITION := true

# Graphics
BOARD_EGL_CFG := device/zte/NX503A/prebuilt/system/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true

TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

# Media
#TARGET_QCOM_MEDIA_VARIANT := caf
TARGET_QCOM_MEDIA_VARIANT := v4l2
BOARD_CHARGER_ENABLE_SUSPEND := true

# GPS
#TARGET_PROVIDES_GPS_LOC_API := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# QCOM enhanced A/V
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Lights
#TARGET_PROVIDES_LIBLIGHT := true

# Time
#BOARD_USES_QC_TIME_SERVICES := true

# Use the CM PowerHAL
TARGET_USES_CM_POWERHAL := true
#CM_POWERHAL_EXTENSION := qcom

# Webkit
ENABLE_WEBGL := true
#TARGET_FORCE_CPU_UPLOAD := true

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)

WIFI_DRIVER_MODULE_NAME := "bcmdhd"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/vendor/firmware/fw_bcmdhd.bin nvram_path=/system/etc/wifi/nvram.txt"
WIFI_DRIVER_MODULE_AP_ARG := "firmware_path=/system/vendor/firmware/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram.txt"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P:= ""


# Custom boot
#TARGET_PROVIDES_INIT_RC := true
BOARD_CUSTOM_BOOTIMG_MK := device/zte/NX503A/custombootimg.mk

# Recovery
#TARGET_RECOVERY_INITRC := device/zte/NX503A/recovery/recovery.rc
TARGET_RECOVERY_FSTAB := device/zte/NX503A/prebuilt/root/fstab.qcom
RECOVERY_FSTAB_VERSION := 2
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_EXT4 := true
#TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

#BOARD_HARDWARE_CLASS := device/sony/rhine-common/cmhw

#BOARD_SEPOLICY_DIRS += \
#    device/zte/NX503A/sepolicy

#BOARD_SEPOLICY_UNION += \
#    file_contexts \
#    property_contexts \
#    te_macros \
#    bluetooth_loader.te \
#    bridge.te \
#    camera.te \
#    device.te \
#    dhcp.te \
#    domain.te \
#    drmserver.te \
#    file.te \
#    kickstart.te \
#    init.te \
#    mac_update.te \
#    mediaserver.te \
#    mpdecision.te \
#    netmgrd.te \
#    property.te \
#    qmux.te \
#    rild.te \
#    rmt.te \
#    surfaceflinger.te \
#    system.te \
#    tee.te \
#    thermald.te \
#    ueventd.te \
#    wpa_supplicant.te
