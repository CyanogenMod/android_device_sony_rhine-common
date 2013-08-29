LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_VENDOR_PLATFORM),rhine)
    include $(call all-subdir-makefiles,$(LOCAL_PATH))

    $(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wcd9320; \
        ln -sf /data/misc/audio/wcd9320_anc.bin \
        $(TARGET_OUT_ETC)/firmware/wcd9320/wcd9320_anc.bin; \
        ln -sf /data/misc/audio/wcd9320_mad_audio.bin \
        $(TARGET_OUT_ETC)/firmware/wcd9320/wcd9320_mad_audio.bin; \
        ln -sf /data/misc/audio/mbhc.bin \
        $(TARGET_OUT_ETC)/firmware/wcd9320/wcd9320_mbhc.bin)
endif
