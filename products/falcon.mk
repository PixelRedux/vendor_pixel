$(call inherit-product, device/motorola/falcon/full_falcon.mk)

# Inherit some common pixel stuff.
$(call inherit-product, vendor/pixel/config/common_full_phone.mk)

PRODUCT_RELEASE_NAME := MOTO G
PRODUCT_NAME := pixel_falcon
