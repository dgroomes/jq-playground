#!/usr/bin/env bash
# Trying out one of jq's more complicated functions: "foreach"

# echo '[1,2,3,4]' | jq 'foreach .[] as $i (10; . - $i; .)'

echo '[{"step": "a", "y": 1},{"step": "b", "y": 2},{"step": "c", "y": 3},{"step": "d", "y": 4}]' | jq -c 'include "mylib"; accumulate_until_ten(.y)'