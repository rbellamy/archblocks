#!/bin/bash -x
# ------------------------------------------------------------------------
# archblocks - minimal, modular, manual Arch Linux install script
# ------------------------------------------------------------------------
# es@ethanschoonover.com @ethanschoonover http://github.com/altercation/archblocks

# INSTRUCTIONS -----------------------------------------------------------
# boot into Arch Install media and run (for this script only):
#
# curl https://raw.github.com/altercation/archblocks/master/sample_installer.sh" > install.sh
#     (...manually review the code! look at the blocks in the repo, then...)
# bash install.sh

# RESPOSITORY ------------------------------------------------------------
REMOTE=https://raw.github.com/rbellamy/archblocks/master

# CONFIG -----------------------------------------------------------------

HOSTNAME=uruk
USERNAME=rbellamy
USERSHELL=/bin/zsh
FONT=Lat2-Terminus16
FONT_MAP=8859-1_to_uni
LANGUAGE=en_US.UTF-8
KEYMAP=dvorak
TIMEZONE=US/Pacific
MODULES="dm_mod dm_crypt aes_x86_64 ext2 ext4 vfat intel_agp drm i915"
HOOKS="base udev autodetect pata scsi sata usb usbinput keymap consolefont encrypt filesystems fsck shutdown"
KERNEL_PARAMS="quiet i915.i915_enable_rc6=1 i915.i915_enable_fbc=1 i915.lvds_downclock=1"
# KERNEL_PARAMS is used in FILESYSTEM, INIT, BOOTLOADER blocks (gets added to)

# DOTFILES / HOME SETUP --------------------------------------------------
# mr (available in AUR) allows you to setup your home dir using dvcs such
# as git, hg, svn and execute shell scripts automatically. 
# list a url to use as a mr config file and archblocks core install will
# su to the new user's (USERNAME above) home and bootstrap using it.
# mr will be installed if this variable is set.
#MR_BOOTSTRAP=https://raw.github.com/altercation/es-etc/master/vcs/.mrconfig

# BLOCKS -----------------------------------------------------------------
TIME=common/time_chrony_utc
FILESYSTEM=filesystem/gpt_luks_passphrase_ext4
BOOTLOADER=bootloader/efi_gummiboot
NETWORK=network/wired_wireless_default
AUDIO=common/audio_alsa
POWER=common/power_acpi
SENSORS=common/sensors_default
INIT=init/systemd_pure
XORG="xorg/xorg_default xorg/xorg_fonts_infinality xorg/xorg_wacom xorg/xorg_synaptics xorg/mesa_dri"
VIDEO=video/video_intel
DESKTOP=xorg/desktop_gnome
HARDWARE=hardware/laptop/lenovo_thinkpad_t420
APPSETS="appsets/gvim_basics appsets/mutt_basics appsets/chrome_basics"

# EXTRA PACKAGES ---------------------------------------------------------
# if you don't want to create a new block, you can specify extra packages
# from official repos or AUR here (simple space separated list of packages)
PACKAGES="git rxvt-unicode xterm zsh"
AURPACKAGES="termite-git"

# EXECUTE ----------------------------------------------------------------
. <(curl -fsL "${REMOTE}/blocks/_lib/helpers.sh"); _loadblock "_lib/core"

