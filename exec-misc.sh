#!/usr/bin/env bash
# Miscellaneous

echo "10" | jq -r 'include "mylib"; surprise_math'
