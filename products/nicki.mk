# Copyright (C) 2014 The PixelROM Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit pixel common GSM stuff.
$(call inherit-product, vendor/pixel/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/pixel/config/nfc_enhanced.mk)

# Inherit some common pixel stuff.
$(call inherit-product, vendor/pixel/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/sony/nicki/full_nicki.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := nicki
PRODUCT_NAME := pixel_nicki
PRODUCT_BRAND := Sony
PRODUCT_MODEL := C1905
PRODUCT_MANUFACTURER := Sony
PRODUCT_CHARACTERISTICS := phone
