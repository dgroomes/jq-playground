#!/usr/bin/env bash
# Examples of "sort" and "sort_by"

#echo '[1,3,2]' | jq 'sort'

#echo '{"items": [2,1]}' | jq '.items |= sort'

#echo '{"items": [{"letter": "A", "number": 2}, {"letter": "B", "number": 1}]}' | jq '.items |= sort_by(.number)'

echo '{"B": {"nestedB": null, "nestedA": null}, "A": null}' | jq --sort-keys
