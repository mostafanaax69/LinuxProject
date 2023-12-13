#!/bin/bash

SRC_DIR=/home/parallels/Documents
DST_DIR=/home/parallels/Desktop/backup

if [ ! -d "$DST_DIR" ]; then
    mkdir -p "$DST_DIR"
fi

for file in "$SRC_DIR"/*; do
    cp "$file" "$DST_DIR"
done

