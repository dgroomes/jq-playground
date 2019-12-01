#!/usr/bin/env bash

# I want to use enrich_pipeline to enrich an object like so:
#
# Stage 1: { "stage_one": 1 }
# Stage 2: { "stage_one": 1, "stage_two": 2 }
# Stage 3: { "stage_one": 1, "stage_two": 2, "stage_three": 3 }
# 
# But it does not work. The actual final result is:
# Stage 3: { "stage_one": 1, "stage_two": 2, "stage_three": 1 }
#
# The "stage_three" value should be 3 but it is 1.
echo '{ "stage_one": 1 }' | jq 'include "mylib"; . as $sub | exec_fns_foreach_obj([stage_two, stage_three]; $sub)'
# UPDATE: it works with the exec_fns_foreach_obj function! See belows

# This kind of does something
# echo '{ "stage_one": 1 }' | jq 'include "mylib"; . | exec_fns_foreach([stage_two, stage_three]; { "stage_one": 1 })'

# This kind of does something even better and is more DRY
#echo '{ "stage_one": 100 }' | jq 'include "mylib"; . as $sub | exec_fns_foreach([stage_two, stage_three]; $sub)'

# SUCCESS
#echo '{ "stage_one": 1 }' | jq 'include "mylib"; . as $sub | exec_fns_foreach_obj([stage_two, stage_three]; $sub)'

