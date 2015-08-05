#
# Copyright (C) 2013 The Android Open-Source Project
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

LOCAL_PATH := device/asus/T00F

$(call inherit-product, device/asus/T00F/intel-boot-tools/Android.mk)

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Intel Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Ramdisk
PRODUCT_PACKAGES += \
    config_init.sh \
    fstab \
    fstab.redhookbay \
    fstab.zram \
    init.a500cg.usb.rc \
    init.avc.rc \
    init.bt.rc \
    init.bt.vendor.rc \
    init.common.rc \
    init.compass.rc \
    init.config_init.rc \
    init.debug.rc \
    init.diag.rc \
    init.environ.rc \
    init.firmware.rc \
    init.gps.rc \
    init.logtool.rc \
    init.modem.rc \
    init.recovery.redhookbay.rc \
    init.redhookbay.rc \
    init.trace.rc \
    init.usb.rc \
    init.watchdog.rc \
    init.wifi.rc \
    init.wifi.vendor.rc \
    init.wireless.rc \
    init.zram.rc \
    intel_prop.cfg \
    rfkill_bt.sh \
    ueventd.redhookbay.rc

# specific management of audio_policy.conf
PRODUCT_COPY_FILES += \
    device/asus/T00F/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/asus/T00F/configs/media_codecs.xml:system/etc/media_codecs.xml \
    device/asus/T00F/configs/audio_policy.conf:system/etc/audio_policy.conf

# idc
PRODUCT_COPY_FILES += \
	device/asus/T00F/idc/rmi4_ts.idc:system/usr/idc/rmi4_ts.idc \
	device/asus/T00F/idc/synaptics_dsx.idc:system/usr/idc/synaptics_dsx.idc \
	device/asus/T00F/idc/Vendor_0b05_Product_17fc.idc:system/usr/idc/Vendor_0b05_Product_17fc \
	device/asus/T00F/idc/Vendor_0b05_Product_1803.idc:system/usr/idc/Vendor_0b05_Product_1803.idc

# keylayout and keychars
PRODUCT_COPY_FILES += \
	device/asus/T00F/keylayout/cloverview_audio_Intel_MID_Audio_Jack.kl:system/usr/keylayout/cloverview_audio_Intel_MID_Audio_Jack.kl \
	device/asus/T00F/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	device/asus/T00F/keylayout/intel_short_long_press.kl:system/usr/keylayout/intel_short_long_press.kl \
	device/asus/T00F/keylayout/rmi4_key.kl:system/usr/keylayout/rmi4_key.kl \
	device/asus/T00F/keylayout/rmi4_key_gff.kl:system/usr/keylayout/rmi4_key_gff.kl \
	device/asus/T00F/keylayout/synaptics_dsx.kl:system/usr/keylayout/synaptics_dsx.kl \
	device/asus/T00F/keylayout/Vendor_0b05_Product_17fc.kl:system/usr/keylayout/Vendor_0b05_Product_17fc.kl \
	device/asus/T00F/keylayout/Vendor_0b05_Product_1803.kl:system/usr/keylayout/Vendor_0b05_Product_1803.kl \
	device/asus/T00F/keylayout/synaptics_dsx.kcm:system/usr/keychars/synaptics_dsx.kcm

# alsa config
PRODUCT_COPY_FILES += \
	device/asus/T00F/configs/alsa.conf:system/usr/share/alsa/alsa.conf

# GPS
PRODUCT_COPY_FILES += \
    device/asus/T00F/configs/gps.conf:system/etc/gps.conf \
    device/asus/T00F/configs/gps.xml:system/etc/gps.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.spid.gps.tty=ttyMFD2

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    lib_driver_cmd_bcmdhd \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    bcmdhd.cal

# Light
PRODUCT_PACKAGES += \
    lights.clovertrail

# Audio
PRODUCT_PACKAGES += \
    libtinycompress \
    libtinyalsa \
    audio.a2dp.default \
    audio.primary.default \
    audio.r_submix.default \
    audio.usb.default \
    libaudioutils

PRODUCT_PACKAGES += \
    libwsbm

PRODUCT_PACKAGES += \
    com.intel.multidisplay.xml \
    com.intel.multidisplay \
    libmultidisplay \
    libmultidisplayjni \
    pvr_drv_video

PRODUCT_PACKAGES += \
    libwrs_omxil_common \
    libwrs_omxil_core_pvwrapped

PRODUCT_PACKAGES += \
    libstagefrighthw \
    libOMXVideoDecoderAVC \
    libOMXVideoDecoderH263 \
    libOMXVideoDecoderMPEG4 \
    libOMXVideoDecoderWMV \
    libOMXVideoEncoderAVC \
    libOMXVideoEncoderH263 \
    libOMXVideoEncoderMPEG4 \
    libOMXVideoDecoderAVCSecure \
    libtinyalsa-subsystem

PRODUCT_PACKAGES += \
    libmixvbp \
    libmixvbp_h264 \
    libmixvbp_h264secure \
    libmixvbp_mpeg4 \
    libmixvbp_vc1

PRODUCT_PACKAGES += \
    libmix_imagedecoder \
    libmix_imageencoder

# Media SDK and OMX IL components
PRODUCT_PACKAGES += \
    msvdx_bin \
    topaz_bin

# libva
PRODUCT_PACKAGES += \
    libva \
    libva-android \
    libva-tpi \
    vainfo

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.webview.xml:system/etc/permissions/android.software.webview.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.usb.default \
    audio.primary.default

# usb
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    tune2fs \
    resize2fs

PRODUCT_PACKAGES += \
    Stk \
    Torch 

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# library 
PRODUCT_PACKAGES += \
    libtinyxml \
    minizip \
    openssl \
    pack_intel \
    unpack_intel

PRODUCT_PACKAGES += \
    link_modprobe

DEVICE_PACKAGE_OVERLAYS := \
    $(LOCAL_PATH)/overlay

#ituxd for thermal management
ENABLE_ITUXD := true
PRODUCT_PACKAGES += \
        ituxd

PRODUCT_PACKAGES += libart-extension

# Add props used in stock
PRODUCT_PROPERTY_OVERRIDES += \
    ro.streaming.video.drs=true \
    ro.config.low_ram=false \
    ro.ril.status.polling.enable=0 \
    rild.libpath=/system/lib/librapid-ril-core.so \
    ro.telephony.default_network=0 \
    ro.telephony.ril_class=Zenfone5RIL
    ro.dalvik.vm.isa.arm=x86 \
    ro.enable.native.bridge.exec=1 \
    dalvik.jit.code_cache_size=1048576 \
    ro.hwui.texture_cache_size=24.0f

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-asus \
    ro.com.google.clientidbase.ms=android-asus \
    ro.com.google.clientidbase.am=android-asus \
    ro.com.google.clientidbase.gmm=android-asus \
    ro.com.google.clientidbase.yt=android-asus

# Hardware
BOARD_HARDWARE_CLASS := device/asus/T00F/cmhw

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.debuggable=1 \
    persist.sys.usb.config=mtp \
    ro.secure=0 \
    ro.adb.secure=0 


$(call inherit-product-if-exists, vendor/asus/a500cg/a500cg-vendor.mk)
$(call inherit-product-if-exists, vendor/intel/PRIVATE/a500cg/device-vendor.mk)
$(call inherit-product-if-exists, vendor/intel/a500cg/builts/houdini/houdini.mk)

# Add WiFi Firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4339/device-bcm.mk)