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
echo '{ "stage_one": 1 }' | jq 'include "mylib"; enrich_pipeline([stage_two, stage_three])'