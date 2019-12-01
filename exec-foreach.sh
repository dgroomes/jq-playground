#!/usr/bin/env bash
# Trying out one of jq's more complicated functions: "foreach"

echo '[1,2,3,4]' | jq 'foreach .[] as $i (10; . - $i; .)'