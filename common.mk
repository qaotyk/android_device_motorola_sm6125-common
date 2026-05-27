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

# Audio

# Audio - configs

# Bootctrl

# Camera

# Display

# DRM

# EGL

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-service \
    android.hardware.fastboot@1.1-impl \
    android.hardware.fastboot@1.1-service

# FM

# GPS

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


# Media

# Media - configs

# NFC

# OEM Partition

# Perf

# Power

# Overlay

# Partitions

# Permissions

# Properties

# Ramdisk

# Public Libraries

# RIL

# Sensors

# IMS

# Thermal

# USB configs

# Vendor Service Manager

# Vibrator

# Webview

# Wifi

# Get non-open-source specific aspects