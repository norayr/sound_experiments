#!/bin/bash
set -x
# === CONFIGURATION ===
MP3_SOURCE_FILE="/tmp/REC001.mp3"
DJ_NAME="tanakian"

# === DATE AND TIME SETUP ===
UTC_DAY=$(date -u '+%u')         # Day of week in UTC: Monday=1 ... Sunday=7
UTC_HOUR=$(date -u '+%H')        # Hour in UTC
UTC_MIN=$(date -u '+%M')         # Minute in UTC

# Check if it's Saturday and before 21:00 UTC
if [ "$UTC_DAY" -ne 6 ]; then
    echo "It's not Saturday (UTC). Not uploading."
    exit 1
fi

if [ "$UTC_HOUR" -gt 21 ] || { [ "$UTC_HOUR" -eq 21 ] && [ "$UTC_MIN" -gt 0 ]; }; then
    echo "Too late to upload — past 21:00 UTC."
    exit 1
fi

# === BUILD TARGET FILENAME ===
FILENAME_PREFIX=$(date -u '+%y%m%d')2100
DEST_FILENAME="${FILENAME_PREFIX}_${DJ_NAME}.mp3"

echo "Uploading ${MP3_SOURCE_FILE} as ${DEST_FILENAME}..."

# === UPLOAD USING curl (FTP anonymous) ===
curl -T "${MP3_SOURCE_FILE}" "ftp://anonradio.net/pub/incoming/${DEST_FILENAME}" --ftp-create-dirs

if [ $? -eq 0 ]; then
    echo "Upload successful!"
else
    echo "Upload failed!"
    exit 2
fi

