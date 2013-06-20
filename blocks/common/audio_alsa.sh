#!/bin/bash
#
# alsa sound
# ------------------------------------------------------------------------

_installpkg alsa-utils alsa-plugins

if [ ! _systemd ]; then
    _daemon_add @alsa
fi

# if alsamixer isn't working, try alsamixer -Dhw and speaker-test -Dhw -c 2


