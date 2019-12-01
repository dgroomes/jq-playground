#!/usr/bin/env bash
# Trying out one of jq's more complicated functions: "foreach"

# echo '[1,2,3,4]' | jq 'foreach .[] as $i (10; . - $i; .)'

#echo '[{"step": "a", "y": 1},{"step": "b", "y": 2},{"step": "c", "y": 3},{"step": "d", "y": 4}]' | jq -c 'include "mylib"; accumulate_until_ten(.y)'

# This doesn't work
#echo '"ignored"' | jq 'include "mylib"; accumulate_inverted([my_add_one,my_add_two])'

# ?
echo '"ignored"' | jq 'include "mylib"; 999 | exec_fns_foreach([my_add_one, my_add_two, my_add_three, my_add_four]; 10)'
