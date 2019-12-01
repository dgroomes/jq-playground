#!/usr/bin/env bash

#echo '"hello"' | jq 'include "mylib"; enrich(msg_part_one) | enrich(msg_part_two) | enrich(msg_part_three)'

# With enrich_pipeline, we have an alternative that is more expressive 
echo '"hello"' | jq 'include "mylib"; enrich_pipeline([msg_part_one, msg_part_two, msg_part_three])'