$(call inherit-product, device/motorola/ghost/full_ghost.mk)

# Inherit some common pixel stuff.
$(call inherit-product, vendor/pixel/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/pixel/config/nfc_enhanced.mk)

PRODUCT_RELEASE_NAME := MOTO X
PRODUCT_NAME := pixel_ghost
