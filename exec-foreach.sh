#!/usr/bin/env bash
# Trying out one of jq's more complicated functions: "foreach"

# echo '[1,2,3,4]' | jq 'foreach .[] as $i (10; . - $i; .)'

echo '[{"x": 0, "y": 1},{"x": 0, "y": 2},{"x": 0, "y": 3},{"x": 0, "y": 4}]' | jq -c 'include "mylib"; accumulate_until_ten(.y)'