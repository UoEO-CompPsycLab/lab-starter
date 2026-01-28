#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
required=(
  "data/raw/squirrels"
  "data/generated/bandit"
  "data/generated/trident"
  "data/processed/squirrels"
  "data/processed/trident"
  "reports/bandit"
  "reports/squirrels"
  "reports/trident"
  "results/figures"
  "results/tables"
  "src"
)

created_dirs=()
created_keeps=()

for rel in "${required[@]}"; do
  path="$root/$rel"
  if [ ! -d "$path" ]; then
    mkdir -p "$path"
    created_dirs+=("$rel")
  fi
done

for rel in "${required[@]}"; do
  path="$root/$rel"
  keep="$path/.gitkeep"

  shopt -s nullglob dotglob
  items=("$path"/*)
  shopt -u nullglob dotglob

  nonkeep=()
  for item in "${items[@]}"; do
    base="$(basename "$item")"
    if [ "$base" != ".gitkeep" ]; then
      nonkeep+=("$item")
    fi
  done

  if [ ${#nonkeep[@]} -eq 0 ]; then
    if [ ! -e "$keep" ]; then
      : > "$keep"
      created_keeps+=("$rel/.gitkeep")
    fi
  fi
done

echo "Created directories: ${#created_dirs[@]}"
if [ ${#created_dirs[@]} -gt 0 ]; then
  printf '  - %s\n' "${created_dirs[@]}"
fi

echo "Created .gitkeep files: ${#created_keeps[@]}"
if [ ${#created_keeps[@]} -gt 0 ]; then
  printf '  - %s\n' "${created_keeps[@]}"
fi
