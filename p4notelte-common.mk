#
# Copyright (C) 2012 The CyanogenMod Project
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
#

$(call inherit-product, device/samsung/smdk4412-common/common.mk)

$(call inherit-product, device/samsung/smdk4412-qcom-common/common.mk)

LOCAL_PATH := device/samsung/p4notelte-common

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-common

PRODUCT_AAPT_CONFIG := xlarge mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 1280

# Packages
PRODUCT_PACKAGES += \
    SamsungServiceMode

#RIL
PRODUCT_PACKAGES += \
    libsecril-shim\
    libsamsung_symbols

PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0,wlan0,gprs,ppp0 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/n80xx-common/configs/audio_policy.conf:system/etc/audio_policy.conf \
    device/samsung/n80xx-common/configs/tiny_hw.xml:system/etc/sound/tiny_hw.xml

# Camera
PRODUCT_COPY_FILES += \
    device/samsung/n80xx-common/configs/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    camera.smdk4x12

# IR packages
PRODUCT_PACKAGES += \
    consumerir.exynos4

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.software.connectionservice.xml:system/etc/permissions/android.software.connectionservice.xml

# Set product characteristic to tablet, needed for some ui elements
PRODUCT_CHARACTERISTICS := tablet

$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/samsung/p4notelte/p4notelte-vendor.mk)
