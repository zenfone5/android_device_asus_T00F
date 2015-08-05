LOCAL_PATH := device/asus/T00F
TARGET_NO_BOOTLOADER := false
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RECOVERY := false
TARGET_PRELINK_MODULE := false

TARGET_ARCH := x86
TARGET_ARCH_VARIANT := x86-atom
TARGET_CPU_ABI := x86
TARGET_CPU_ABI_LIST := x86,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := x86,armeabi-v7a,armeabi
TARGET_CPU_SMP := true
TARGET_KERNEL_CROSS_COMPILE_PREFIX := x86_64-linux-android-
TARGET_BOARD_KERNEL_HEADERS := device/asus/T00F/kernel-headers


TARGET_RELEASETOOLS_EXTENSIONS := device/asus/T00F/releasetools

TARGET_BOARD_KERNEL_HEADERS := device/asus/T00F/kernel-headers

# skip some proccess to speed up build
BOARD_SKIP_ANDROID_DOC_BUILD := true
BUILD_EMULATOR := false

INTEL_INGREDIENTS_VERSIONS := true
LOCAL_CFLAGS += -DARCH_IA32
TARGET_PRELINK_MODULE := false

# Bootloader
TARGET_OTA_ASSERT_DEVICE := T00F

#BINDER
TARGET_USES_64_BIT_BINDER := true

# Security
BUILD_WITH_SECURITY_FRAMEWORK := chaabi_token
BUILD_WITH_CHAABI_SUPPORT := true


#add some intel BOOTCLASSPATH
#PRODUCT_BOOT_JARS += com.intel.config com.intel.multidisplay
PRODUCT_BOOT_JARS += com.intel.multidisplay


# skip some proccess to speed up build
BOARD_SKIP_ANDROID_DOC_BUILD := true
BUILD_EMULATOR := false

# enable ARM codegen for x86 with Houdini
BUILD_ARM_FOR_X86 := true


TARGET_RECOVERY_FSTAB := device/asus/T00F/rootdir/etc/fstab.redhookbay

TARGET_BOARD_PLATFORM := clovertrail
TARGET_BOOTLOADER_BOARD_NAME := clovertrail
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1363148800
BOARD_FLASH_BLOCK_SIZE := 2048

TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Use dlmalloc
MALLOC_IMPL := dlmalloc

# Malloc Alignment
BOARD_MALLOC_ALIGNMENT := 16

# Appends path to ARM libs for Houdini
PRODUCT_LIBRARY_PATH := $(PRODUCT_LIBRARY_PATH):/system/lib/arm

# Inline kernel building
TARGET_KERNEL_BUILT_FROM_SOURCE := true
TARGET_KERNEL_CONFIG := T00F_defconfig
TARGET_KERNEL_SOURCE := kernel/asus/T00F
TARGET_KERNEL_ARCH := x86
BOARD_KERNEL_IMAGE_NAME := bzImage

# prebuild source kernel
BOARD_CUSTOM_BOOTIMG_MK := device/asus/T00F/intel-boot-tools/boot.mk
DEVICE_BASE_BOOT_IMAGE := device/asus/T00F/blobs/boot.img
DEVICE_BASE_RECOVERY_IMAGE := device/asus/T00F/blobs/recovery-WW-3.23.40.52.img

# Kernel config (reference only)
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
cmdline_extra := watchdog.watchdog_thresh=60 androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx androidboot.serialno=01234567890123456789012345678901
cmdline_extra1 := ip=50.0.0.2:50.0.0.1::255.255.255.0::usb0:on vmalloc=172M androidboot.wakesrc=05 androidboot.mode=main loglevel=8 
cmdline_extra2 := loglevel=8 kmemleak=off androidboot.bootmedia=sdcard androidboot.hardware=redhookbay androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE := init=/init pci=noearly console=logk0 earlyprintk=nologger  $(cmdline_extra)  $(cmdline_extra1)  $(cmdline_extra2) 

BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

# Wifi
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER        := NL80211
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/firmware/fw_bcmdhd.bin"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/asus/T00F/bluetooth

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote32

# Enabling Houdini by default
ADDITIONAL_BUILD_PROPERTIES += ro.product.cpu.abi2=armeabi-v7a

# kernel Mmap memory bottom-up
ADDITIONAL_BUILD_PROPERTIES += ro.config.personality=compat_layout

# NFC
BOARD_HAVE_NFC := false

# Audio
BOARD_USES_TINY_ALSA_AUDIO := true

# DRM Protected Video
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1
USE_INTEL_SECURE_AVC := true

# enable ARM codegen for x86 with Houdini
BUILD_ARM_FOR_X86 := true

# HW_Renderer
USE_OPENGL_RENDERER := true

# DPST
INTEL_DPST := true

# HWComposer
BOARD_USES_HWCOMPOSER := true

# RILD
#RIL_SUPPORTS_SEEK := true

# GPS
BOARD_HAVE_GPS := true

# RMT_STORAGE
BOARD_USES_LEGACY_MMAP := true

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.opengles.version=131072 \
    gsm.net.interface=rmnet0 \
    persist.system.at-proxy.mode=0 \
    ro.dalvik.vm.native.bridge=libhoudini.so

# File system
# Storage information
BOARD_HAS_LARGE_FILESYSTEM := true

# Recovery global
TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/ramdisk/init.recovery.redhookbay.rc
BOARD_RECOVERY_SWIPE := true
BOARD_UMS_LUNFILE := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun/file"


# SELinux
HAVE_SELINUX := true
BOARD_SEPOLICY_DIRS += device/asus/T00F/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    seapp_contexts \
    property_contexts \
    service_contexts \
    genfs_contexts \
    file.te \
    device.te \
    domain.te \
    installd.te \
    gpsd.te \
    vold.te \
    bcu_cpufreqrel.te \
    intel_prop.te \
    surfaceflinger.te \
    zygote.te \
    fg_conf.te \
    isolated_app.te \
    pvrsrvctl.te \
    servicemanager.te \
    keystore.te \
    bluetooth.te \
    surfaceflinger.te \
    system_app.te \
    hdcpd.te \
    drmserver.te \
    file.te \
    radio.te \
    shell.te \
    mediaserver.te \
    nvm_server.te \
    vdc.te \
    su.te  \
    system_server.te \
    platform_app.te \
    service.te \
    mmgr.te \
    init.te \
    init_shell.te \
    property.te \
    kernel.te \
    sysfs_uart_power_ctrl.te \
    ueventd.te \
    logcat.te \
    netd.te \
    wpa.te \
    rild.te \
    akmd.te \
    gauge.te \
    customize.te \
    untrusted_app.te

# Build From source
BOARD_USES_WRS_OMXIL_CORE := true
USE_INTEL_MDP := true
BUILD_WITH_FULL_STAGEFRIGHT := true
BOARD_USES_MRST_OMX := true
BOARD_USES_WRS_OMXIL_CORE := true
BOARD_USE_LIBVA_INTEL_DRIVER := true
BOARD_USE_LIBVA := true
BOARD_USE_LIBMIX := true
INTEL_VA := true
ENABLE_IMG_GRAPHICS := true

USE_MDS_LEGACY := true
TARGET_HAS_MULTIPLE_DISPLAY := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Define platform battery healthd library
BOARD_HAL_STATIC_LIBRARIES += libhealthd.intel

# Rild
# Radio
BOARD_RIL_SUPPORTS_MULTIPLE_CLIENTS := true
BOARD_RIL_CLASS := ../../../device/asus/T00F/ril

BOARD_FUNCTIONFS_HAS_SS_COUNT := true

# Init
TARGET_IGNORE_RO_BOOT_SERIALNO := true