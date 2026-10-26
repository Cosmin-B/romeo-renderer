#!/bin/sh
# The regression is present if the asset-lock wait (63 ms) pushes the p95 frame time above threshold, resident memory balloons from ~292 to ~1018 MiB due to per-view texture copies, or the build crashes (exit_code != 0 / crashed true), so the check requires all three to be within healthy bounds.
# Passes when: lock_wait_max_ms < 30 and p95_ms < 40 and resident_end_bytes < 400*1024*1024
exec python3 "$(dirname "$0")/runcheck.py" "$1" "$2" B 1200 1 'lock_wait_max_ms < 30 and p95_ms < 40 and resident_end_bytes < 400*1024*1024'
