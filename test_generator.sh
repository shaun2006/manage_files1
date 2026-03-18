#!/bin/bash

cases=("txt" "mpv" "docx" "pdf")
mkdir "test"
for ext in "${cases[@]}"; do
  touch "test"/"test_file.$ext"
done

echo "Test files created inside 'test' directory"
tree "test/"
