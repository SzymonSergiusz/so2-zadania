#!/usr/bin/env bash
ERRORS=$(./dane/fakaping.sh 2>&1 >/dev/null)
echo "$ERRORS" | sort | tee denied.log