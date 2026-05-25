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

COMMON_PATH := device/motorola/sm6125-common

TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

BOARD_VENDOR := motorola

# Architecure (1st Architecture)
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a77
TARGET_CPU_VARIANT_RUNTIME := kryo

# Architecure (2nd Architecture)
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := arm-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a77

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := sm6125
TARGET_BOARD_PLATFORM := trinket
TARGET_BOARD_PLATFORM_GPU := qcom-adreno612
BOARD_USES_QCOM_HARDWARE := true

# AVB
BOARD_USES_HWC2 := true
BOARD_AVB_ENABLE := true
BOARD_AVB_ALGORITHM := SHA256_RSA4096
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_ROLLBACK_INDEX := 6

# Audio
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := true
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SSR := true
BOARD_SUPPORTS_OPENSOURCE_STHAL := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_QCOM_AUDIO := true
BOARD_SUPPORTS_SOUND_TRIGGER_HCI := true
BOARD_QTI_USE_QAF := true
BOARD_QTI_USE_SPKR_PROTECT := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_HAVE_QCOM_BT_IPC := true
QCOM_BT_USE_BTNV := true

# Kernel configuration
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CONFIG := vendor/trinket-perf_defconfig vendor/ext_config/moto-trinket.config
TARGET_KERNEL_SOURCE := kernel/motorola/sm6125

# Kernel parameters
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00008000
BOARD_KERNEL_IMAGE_NAME := Image

# Kernel commandline
BOARD_KERNEL_CMDLINE := \
	androidboot.console=ttyMSM0, 115200, n8 \
	androidboot.hardware=qcom \
	androidboot.memcg=1 \
	console=ttyMSM0,115200n8 \
	earlycon=msm_geni_serial,0x4a90000 \
	loop.max_part=7 \
	lpm_levels.sleep_disabled=1 \
	msm_rtb.filter=0x237 \
	service_locator.enable=1 \
	swiotlb=1 \
	androidboot.usbcontroller=4e00000.dwc3 \
	cgroup.memory=nokmem,nosocket \
	ehci-hcd.park=3 \
	printk.devkmsg=on \
	firmware_class.path=/vendor/firmware_mnt/image
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

# Ramdisk
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_ROOT_EXTRA_SYMLINKS := \
    /vendor/fsg:/fsg

# Kernel Modules - Audio

# Kernel Modules - WLAN

# Partitions - System

# Partitions - Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true

# Partitions - ODM

# Partitions - Vendor

# RIL Service
ENABLE_VENDOR_RIL_SERVICE := true

# Sepolicy
include device/qcom/sepolicy_vndr/SEPolicy.mk
include hardware/motorola/sepolicy/qti/SEPolicy.mk

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
BOARD_VENDOR_QCOM_GPS_LOC_API_VERSION := 3

# Sensor
BOARD_SENSOR_BINDER_SUPPORT := true
BOARD_VENDOR_QTI_SENSOR_HALS := ""
BOARD_USES_QCOM_SENSORS := true
TARGET_HW_SENSOR_BASE := "/vendor/lib64/hw"

# Display
BOARD_PROVIDES_QTI_DISPLAY_HAL := true
BOARD_USES_MEDIA_AUDIO_POLICY := true
TARGET_USES_QCOM_MEDIA_CODEC := true
TARGET_QCOM_DISPLAY_VERSION := ""

# Wifi
BOARD_HAS_QCOM_WIFI := true
BOARD_HAS_QCOM_WIFI_LIBS := libqti-ucin
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WIFI_COUNTRY_CODE_FILE := vendor/qcom/opensource/wlan/qcacld-2.0/wifi/qca_driver/etc/wifi/wifi_country.conf
BOARD_WPA_SUPPLICANT_PRIVATE_LIB_EVENT := "ON"
WIFI_DRIVER_DEFAULT := qca_cld3
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Inherit from the proprietary version
include vendor/motorola/sm6125-common/BoardConfigVendor.mk