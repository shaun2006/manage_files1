#!/bin/bash

dir="$1"

# Check if directory exists
[ -d "$dir" ] || { echo "Invalid folder"; exit 1; }

LIST=()

# Collect extensions
for f in "$dir"/*.*; do
  [ -e "$f" ] || continue
  LIST+=("${f##*.}")
done

# Create unique folders
for ext in $(printf "%s\n" "${LIST[@]}" | sort -u); do
  mkdir -p "$dir/$ext"
done

# Copy files into respective folders
for f in "$dir"/*.*; do
  [ -e "$f" ] || continue
  ext="${f##*.}"
  mv "$f" "$dir/$ext/"
done

echo "Files organized successfully."
tree "$dir"
