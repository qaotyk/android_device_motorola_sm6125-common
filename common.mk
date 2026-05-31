# Copyright (C) 2026 The Android Open Source Project"
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

# Inherit virtual_ab_ota configurations. Mapping virtual blocks on partition /data under OTA updates.
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    recovery \
    vendor

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier \
    otapreopt_script

PRODUCT_PROPERTY_OVERRIDES += \
    ro.update_engine.reboot_after_update=1

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true
    
# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio - Amplifier
PRODUCT_PACKAGES += \
    audio_amplifier.trinket \
    audio.primary.trinket \
    sound_trigger.primary.trinket

# Audio - HAL
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.service

# Audio - Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth.audio@2.0-service \
    android.hardware.bluetooth@1.0-service

# Audio - Soundtrigger
PRODUCT_PACKAGES += \
    android.hardware.soundtrigger@2.1-impl \
    android.hardware.soundtrigger@2.1-service

# Audio - Configs
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(COMMON_PATH)/audio/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    $(COMMON_PATH)/audio/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    $(COMMON_PATH)/audio/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(COMMON_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(COMMON_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(COMMON_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(COMMON_PATH)/audio/audio_ext_spkr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_ext_spkr.conf \
    $(COMMON_PATH)/audio/audio_platform_info_cooke.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_cooke.xml \
    $(COMMON_PATH)/audio/mixer_paths_cooke.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_cooke.xml

# Bootctrl
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-service \
    bootctrl.trinket

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl-qti \
    android.hardware.camera.provider@2.4-service

# Display - Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    android.hardware.graphics.composer@2.4-service \

# Display - Vendor Specifics
PRODUCT_PACKAGES += \
    vendor.qti.hardware.display.allocator-service \

# Display - Hardware
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    gralloc.trinket \
    memtrack.trinket

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey

# EGL
PRODUCT_PACKAGES += \
    libGLES_android

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl \
    android.hardware.fastboot@1.1-service

# FM

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss-aidl-impl-qti \
    android.hardware.gnss-aidl-service-qti \
    gps.conf \
    batching.conf \
    gnss_antenna_info.conf \
    gnss@2.0-base.policy \
    gnss@2.0-xtra-daemon.policy \
    gnss@2.0-qsap-location.policy \
    gnss@2.0-xtwifi-client.policy \
    gnss@2.0-edgnss-daemon.policy \
    libloc_pla_headers \
    liblocation_api_headers \
    libgps.utils_headers \
    liblocation_api \
    libgps.utils \
    libbatching \
    libgeofencing \
    libloc_core \
    libgnss \
    libloc_api_v02 \
    libgnsspps \
    libsynergy_loc_api \
    izat_remote_api_headers \
    loc_sll_if_headers \
    libloc_socket \
    liblocation_api_msg \
    liblocation_integration_api \
    liblocation_client_api

# Init
PRODUCT_PACKAGES += \
    init.class_main.sh \
    init.mdm.sh \
    init.mmi.charge_only.rc \
    init.mmi.rc \
    init.mmi.touch.sh \
    init.oem.hw.sh \
    init.qcom.class_core.sh \
    init.qcom.early_boot.sh \
    init.qcom.power.rc \
    init.qcom.rc \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.recovery.qcom.rc \
    init.target.rc \
    ueventd.rc

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights.service.trinket

# Location - Soong configuration
$(call soong_config_set, qtilocation, feature_nhz, false)
$(call soong_config_set, qtilocation, feature_locauto, false)

# Media

# Media - configs

# NFC

# OEM Partition

# Perf
PRODUCT_PACKAGES += \
    vendor.qti.hardware.perf@2.2-service

# Power

# Overlay

# Partitions

# Permissions - GPS
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.xml

# Permissions - Graphics
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

# Properties - GPS/GNSS
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.overlay.izat.optin=rro \
    persist.vendor.gps.handover=true \
    ro.hardware.gps=default

# Properties - Graphics
PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.egl=adreno \
    ro.hardware.vulkan=adreno \
    ro.opengles.version=196610

# Ramdisk

# Public Libraries
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt \
    $(COMMON_PATH)/configs/public.libraries-qti.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries-qti.txt \
    $(COMMON_PATH)/configs/public.libraries-ext-qti.txt:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/public.libraries-qti.txt

# RIL

# Sensors

# IMS

# Thermal

# USB configs

# Vendor Service Manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Vibrator
PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service

PRODUCT_COPY_FILES += \
    vendor/qcom/opensource/vibrator/excluded-input-devices.xml:$(TARGET_COPY_OUT_VENDOR)/etc/excluded-input-devices.xml

# Webview
PRODUCT_PACKAGES += \
    webview

# Wifi - WCNSS
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(COMMON_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(COMMON_PATH)/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    $(COMMON_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Get non-open-source specific aspects