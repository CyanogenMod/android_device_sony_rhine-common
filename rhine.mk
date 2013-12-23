# Copyright (C) 2013 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# qcom common
$(call inherit-product, device/sony/qcom-common/qcom-common-330.mk)

COMMON_PATH := device/sony/rhine-common

DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

ifneq ($(BOARD_HAVE_RADIO),false)
    DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay-radio
    $(call inherit-product, $(COMMON_PATH)/radio.mk)
endif

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.google.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# GPS
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/gps.conf:system/etc/gps.conf \
    $(COMMON_PATH)/rootdir/system/etc/sec_config:system/etc/sec_config

# WPA supplicant config
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(COMMON_PATH)/rootdir/system/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/fstab.qcom:root/fstab.qcom \
    $(COMMON_PATH)/rootdir/fstab.qcom:recovery/root/fstab.qcom

# Prima wifi config
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \
    $(COMMON_PATH)/rootdir/system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini

# QCOM Display
PRODUCT_PACKAGES += \
    hwcomposer.msm8974 \
    gralloc.msm8974 \
    copybit.msm8974 \
    memtrack.msm8974

PRODUCT_PROPERTY_OVERRIDES += \
    persist.gralloc.cp.level3=1

# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(COMMON_PATH)/rootdir/system/etc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(COMMON_PATH)/rootdir/system/etc/nfcee_access_debug.xml
endif

PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# Recovery
PRODUCT_PACKAGES += \
    extract_elf_ramdisk

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler \
    tinymix

# BT
PRODUCT_PACKAGES += \
    hci_qcomm_init

# Media
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/media_profiles.xml:system/etc/media_profiles.xml

# WIFI MAC update
PRODUCT_PACKAGES += \
    mac-update

# FM Radio
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh

# Key layouts
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/Button_Jack.kl:system/usr/keylayout/Button_Jack.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/mhl-rcp.kl:system/usr/keylayout/mhl-rcp.kl

# Misc
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Custom init / uevent
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/init.qcom.rc:root/init.qcom.rc \
    $(COMMON_PATH)/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc \
    $(COMMON_PATH)/rootdir/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    $(COMMON_PATH)/rootdir/system/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

# Post recovery script
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# Additional sbin stuff
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/charger:root/charger \
    $(COMMON_PATH)/rootdir/sbin/wait4tad_static:root/sbin/wait4tad_static \
    $(COMMON_PATH)/rootdir/sbin/tad_static:root/sbin/tad_static

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qc_nlp_in_use=0

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.handset.mic=analog \
    persist.audio.hp=true \
    ro.qc.sdk.audio.fluencetype=none \
    persist.speaker.prot.enable=false \
    lpa.decode=false \
    lpa.use-stagefright=true \
    tunnel.decode=false \
    tunnel.audiovideo.decode=false \
    tunnel.multiple=false

# aDSP
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.sensors.qmd=false \
    debug.qualcomm.sns.hal=w \
    ro.qc.sdk.sensors.gestures=false \
    ro.qc.sensors.max_accel_rate=false \
    ro.qc.sensors.max_gyro_rate=false \
    ro.qc.sensors.max_mag_rate=false \
    ro.qualcomm.sensors.pedometer=false \
    ro.qualcomm.sensors.pam=false \
    ro.qualcomm.sensors.scrn_ortn=false

# WFD
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0

# HDMI
PRODUCT_PROPERTY_OVERRIDES += \
    persist.demo.hdmirotationlock=false

# Time
PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true

# VIDC debug_levels
# 1:ERROR 2:HIGH 4:LOW 0:NOLOGS 7:AllLOGS
PRODUCT_PROPERTY_OVERRIDES += \
    vidc.debug.level=1

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bt.hci_transport=smd

# Include non-opensource parts
$(call inherit-product, vendor/sony/rhine-common/rhine-common-vendor.mk)
