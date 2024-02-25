#!/bin/bash

# Array berisi string path
paths=(
  "foo/exists1"
  "foo/exists2"
  "foo/missing1"
  "bar/missing1"
)

# Path yang ingin diperiksa
target_path="foo/"

# Fungsi untuk memeriksa apakah path adalah sub path dari target_path
is_subpath() {
  local path="$1"
  if [[ "$path" == "$target_path"* ]]; then
    return 0  # Sub path
  else
    return 1  # Bukan sub path
  fi
}

# Iterasi melalui setiap path dalam array
for path in "${paths[@]}"; do
  if is_subpath "$path"; then
    echo "$path adalah sub path dari $target_path"
  else
    echo "$path bukan sub path dari $target_path. Return error di sini."
    exit 1
  fi
done