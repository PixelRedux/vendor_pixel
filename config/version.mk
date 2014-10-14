
# Set PIXEL_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef PIXEL_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "PIXEL_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^PIXEL_||g')
        PIXEL_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

ifdef BUILDTYPE_NIGHTLY
        PIXEL_BUILDTYPE := NIGHTLY
endif
ifdef BUILDTYPE_AUTOTEST
        PIXEL_BUILDTYPE := AUTOTEST
endif
ifdef BUILDTYPE_EXPERIMENTAL
        PIXEL_BUILDTYPE := EXPERIMENTAL
endif
ifdef BUILDTYPE_RELEASE
        PIXEL_BUILDTYPE := RELEASE
endif

ifndef PIXEL_BUILDTYPE
        PIXEL_BUILDTYPE := UNOFFICIAL
endif

TARGET_PRODUCT_SHORT := $(TARGET_PRODUCT)
TARGET_PRODUCT_SHORT := $(subst pixel_,,$(TARGET_PRODUCT_SHORT))

# Build the final version string
ifdef BUILDTYPE_RELEASE
        PIXEL_VERSION := $(PLATFORM_VERSION)-$(TARGET_PRODUCT_SHORT)
else
ifeq ($(PIXEL_BUILDTIME_LOCAL),y)
        PIXEL_VERSION := PixelROM-$(PLATFORM_VERSION)-$(shell date -u +%Y%m%d)-$(PIXEL_BUILDTYPE)-$(PIXEL_BUILD)
else
        PIXEL_VERSION := PixelROM-$(PLATFORM_VERSION)-$(shell date -u +%Y%m%d)-$(PIXEL_BUILDTYPE)-$(PIXEL_BUILD)
endif
endif


PRODUCT_PROPERTY_OVERRIDES += \
  ro.pixel.version=$(PIXEL_VERSION) \
  ro.modversion=$(PIXEL_VERSION)
  ro.pixel.releasetype=$(PIXEL_BUILDTYPE)

-include vendor/pixel-priv/keys/keys.mk

PIXEL_DISPLAY_VERSION := $(PIXEL_VERSION)

ifneq ($(DEFAULT_SYSTEM_DEV_CERTIFICATE),)
ifneq ($(DEFAULT_SYSTEM_DEV_CERTIFICATE),build/target/product/security/testkey)
  ifneq ($(PIXEL_BUILDTYPE), UNOFFICIAL)
    ifndef TARGET_VENDOR_RELEASE_BUILD_ID
      ifneq ($(PIXEL_EXTRAVERSION),)
        TARGET_VENDOR_RELEASE_BUILD_ID := $(PIXEL_EXTRAVERSION)
      else
        TARGET_VENDOR_RELEASE_BUILD_ID := $(shell date -u +%Y%m%d)
      endif
    else
      TARGET_VENDOR_RELEASE_BUILD_ID := -$(TARGET_VENDOR_RELEASE_BUILD_ID)
    endif
    PIXEL_DISPLAY_VERSION=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(TARGET_VENDOR_RELEASE_BUILD_ID)
  endif
endif
endif

PRODUCT_PROPERTY_OVERRIDES += \
  ro.pixel.display.version=$(PIXEL_DISPLAY_VERSION)

# CM Version
-include vendor/pixel/config/cm_version.mk
