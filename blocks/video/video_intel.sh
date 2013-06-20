#!/bin/bash

# video - intel

_installpkg xf86-video-intel lib32-intel-dri libva-intel-driver

echo "options i915 modeset=1" > /etc/modprobe.d/i915.conf

# unless the desktop manager is installed first, the directory may not exist
[ -d /etc/X11/xorg.conf.d ] || mkdir -p /etc/X11/xorg.conf.d

cat > /etc/X11/xorg.conf.d/20-intel.conf << EOF
Section "Device"
	Identifier  "Intel Graphics"
	Driver      "intel"
	Option      "AccelMethod"  "sna"
	Option      "TearFree" "true"
EndSection
EOF

# TODO: make adding to MODULES list dynamic and add MODULES="intel_agp i915" here
