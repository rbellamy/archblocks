#!/bin/bash
# ------------------------------------------------------------------------
# archblocks - minimal, modular, manual Arch Linux install script
# ------------------------------------------------------------------------
# es@ethanschoonover.com @ethanschoonover http://github.com/altercation/archblocks

# INSTRUCTIONS -----------------------------------------------------------
# boot into Arch Install media and run (for this script only):
#
# curl https://raw.github.com/altercation/archblocks/master/sample_laptop.sh" > install.sh
#     (...manually review the code! look at the blocks in the repo, then...)
# bash install.sh

echo "WARNING: DEV INSTALLER"

# RESPOSITORY ------------------------------------------------------------
REMOTE=https://raw.github.com/rbellamy/archblocks/dev

# CONFIG -----------------------------------------------------------------
HOSTNAME=uruk
USERNAME=rbellamy
USERSHELL=/bin/bash
FONT=Lat2-Terminus16
FONT_MAP=8859-1_to_uni
LANGUAGE=en_US.UTF-8
KEYMAP=dvorak
TIMEZONE=US/Pacific
MODULES="dm_mod dm_crypt aes_x86_64 ext2 ext4 vfat intel_agp drm i915"
#HOOKS="base udev autodetect pata scsi sata usb usbinput consolefont encrypt filesystems fsck shutdown"
# possible fix for occasional blank screen on resume? https://wiki.archlinux.org/index.php/Pm-utils#Blank_screen_issue
HOOKS="base udev autodetect pata scsi sata usb usbinput keymap consolefont encrypt filesystems fsck shutdown"
KERNEL_PARAMS="quiet i915.i915_enable_rc6=1 i915.i915_enable_fbc=1 i915.lvds_downclock=1"

INSTALL_DRIVE=query # "/dev/sda" "query" or blank (blank is the same as "query")

# BLOCKS -----------------------------------------------------------------
TIME=common/time_chrony_utc
FILESYSTEM=filesystem/gpt_luks_passphrase_ext4
BOOTLOADER=bootloader/efi_gummiboot
NETWORK=network/wired_wireless_default

# EXECUTE ----------------------------------------------------------------
. <(curl -fsL "${REMOTE}/blocks/_lib/helpers.sh"); _loadblock "_lib/core"

