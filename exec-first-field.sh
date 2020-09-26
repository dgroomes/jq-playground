#!/usr/bin/env bash
# Get the first field from an object.

echo '{ "a_field": "a_value", "b_field": "b_value" }' | jq '(. | keys[0]) as $firstfield | .[$firstfield]'
