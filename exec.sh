#!/usr/bin/env bash

#echo '"hello"' | jq 'include "mylib"; enrich(msg_part_one) | enrich(msg_part_two) | enrich(msg_part_three)'

# I want an enrich_pipeline function so I can do this. But I can't exactly figure out how to implement enrich_pipeline. See mylib.jq.
echo '"hello"' | jq 'include "mylib"; enrich_pipeline([msg_part_one, msg_part_two, msg_part_three])'