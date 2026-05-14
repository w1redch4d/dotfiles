#!/usr/bin/env bash

set -euo pipefail

URL="https://www.reddit.com/r/wallpaper/best.json?limit=100&t=day"
OUT_DIR="$HOME/Pictures/Wallpapers"
OUT_FILE="$OUT_DIR/pxfuel.png"

mkdir -p "$OUT_DIR"

JSON=$(curl -sL \
    -H "User-Agent: wallpaper-fetcher/1.0" \
    "$URL")

# Verify JSON is valid
echo "$JSON" | jq empty

IMAGE_URL=$(
    echo "$JSON" |
    jq -r '
        .data.children[]
        | .data
        | select(.post_hint == "image")
        | select(.preview.images[0].source.width >= 1920)
        | select(.preview.images[0].source.height >= 1080)
        | .url_overridden_by_dest
    ' |
    head -n 1
)

if [[ -z "$IMAGE_URL" || "$IMAGE_URL" == "null" ]]; then
    echo "No suitable wallpaper found."
    exit 1
fi

echo "Downloading: $IMAGE_URL"

curl -L \
    -H "User-Agent: wallpaper-fetcher/1.0" \
    "$IMAGE_URL" \
    -o "$OUT_FILE"

echo "Saved to: $OUT_FILE"
