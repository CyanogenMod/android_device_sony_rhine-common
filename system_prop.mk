#
# System Properties for rhine
#

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Audio offload
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.buffer.size.kb=32 \
    audio.offload.gapless.enabled=false \
    audio.offload.multiple.enabled=false \
    audio.offload.pcm.enable=enable \
    av.offload.enable=enable \
    av.streaming.offload.enable=enable

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true

# Voice Call
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.fluencetype=none \
    persist.audio.dualmic.config=endfire \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=true

# aDSP
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.sensors.qmd=true \
    debug.qualcomm.sns.hal=w \
    ro.qc.sdk.sensors.gestures=false \
    ro.qc.sensors.max_accel_rate=false \
    ro.qc.sensors.max_gyro_rate=false \
    ro.qc.sensors.max_mag_rate=false \
    ro.qc.sensors.smgr_mag_cal_en=true \
    ro.qualcomm.sensors.pedometer=false \
    ro.qc.sensors.step_counter=true \
    ro.qc.sensors.step_detector=true \
    ro.qualcomm.sensors.pam=false \
    ro.qualcomm.sensors.scrn_ortn=false \
    ro.qualcomm.sensors.georv=true \
    ro.qualcomm.sensors.smd=sony

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bt.hci_transport=smd

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qc_nlp_in_use=0 \
    ro.gps.agps_provider=1 \
    ro.qc.sdk.izat.premium_enabled=1 \
    ro.qc.sdk.izat.service_mask=0x0

# HDMI
PRODUCT_PROPERTY_OVERRIDES += \
    persist.demo.hdmirotationlock=false

# MDP
PRODUCT_PROPERTY_OVERRIDES += \
    debug.mdpcomp.logs=0

# Time
PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true

# Touchscreen
PRODUCT_PROPERTY_OVERRIDES += \
    ro.input.noresample=1

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wlan.driver.ath=0

# WFD
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0
