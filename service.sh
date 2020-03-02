#!/system/bin/sh
# THIS IS JUST A PROOF OF CONCEPT, NOT THE FINISHED PRODUCT
LOGFILE='/cache/lastrun.log'

# Sleep for 2 minutes due to a lot of I/O happening shortly after boot
# -------------------------------------------------------------------
sleep 120

# Clear lastrun.log. After all, it's the LAST run log.
# --------------------------------------------------------
echo -n > "$LOGFILE"

# Perform checks for root and busybox
# -----------------------------------
if [[ $(id -u) -ne 0 ]]; then
    echo "This script needs to be run as root!" | tee "$LOGFILE"
    exit 1
fi
if !( [ -x /system/bin/busybox ] || [ -x /system/xbin/busybox ] ); then
    echo "This script requires BusyBox to be installed in either /system/bin or /system/xbin!" | tee "$LOGFILE"
    exit 1
fi

# Now for the real thing
# ----------------------
for PARTITION in "/cache" "/data" "/system" "/"
do
    echo "Trimming $PARTITION"  | tee -a "$LOGFILE"
    fstrim -v "$PARTITION" 2>&1 | tee -a "$LOGFILE"
done
exit 0
