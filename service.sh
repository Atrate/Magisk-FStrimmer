#!/system/bin/sh

# Copyright (C) 2020 Atrate <atrate@protonmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

LOGFILE='/cache/fstrimmer_lastrun.log'

# Sleep for 2 minutes due to a lot of I/O happening shortly after boot
# -------------------------------------------------------------------
sleep 120

# Clear fstrimmer_lastrun.log. After all, it's the LAST run log.
# --------------------------------------------------------------
echo -n > "$LOGFILE"

# Perform checks for root and busybox. Set all commands' prefix to busybox in case commands are not symlinked properly
# --------------------------------------------------------------------------------------------------------------------
if [[ $(id -u) -ne 0 ]]; then
    echo "This script needs to be run as root!" | tee "$LOGFILE"
    exit 1
fi

if [ -x /system/bin/busybox ]; then
    BUSYBOX='/system/bin/busybox'
elif [ -x /system/xbin/busybox ]; then
    BUSYBOX='/system/xbin/busybox'
else
    echo "This script requires BusyBox to be installed in either /system/bin or /system/xbin!" | tee "$LOGFILE"
    exit 1
fi

# Now for the real thing
# ----------------------
for PARTITION in "/cache" "/data" "/system" "/"
do
    echo "Trimming $PARTITION"  | tee -a "$LOGFILE"
    "$BUSYBOX" fstrim -v "$PARTITION" 2>&1 | tee -a "$LOGFILE"
done
exit 0
