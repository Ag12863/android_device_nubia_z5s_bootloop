$(call inherit-product, device/zte/NX503A/full_NX503A.mk)

# Inherit CM common GSM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit CM common Phone stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=NX503A BUILD_FINGERPRINT=nubia/NX503A/NX503A:4.2.2/JDQ39/eng.nubia.20140210.165901:user/release-keys PRIVATE_BUILD_DESC="NX503A-user 4.2.2 JDQ39 eng.nubia.20140210.165901 release-keys"

PRODUCT_NAME := cm_NX503A
PRODUCT_DEVICE := NX503A
