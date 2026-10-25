#!/bin/sh
# The problem build has lock_waits of 8 (vs 0 on the good build) from read_assets_under_lock=true, so adding a lock-wait threshold alongside the tightened p99 and memory margins cleanly separates the two builds.
# Passes when: p99_ms <= 1.5*p50_ms and memory_growth_mb <= 100 and lock_waits <= 1
exec python3 "$(dirname "$0")/runcheck.py" "$1" "$2" B 1200 1 'p99_ms <= 1.5*p50_ms and memory_growth_mb <= 100 and lock_waits <= 1'
