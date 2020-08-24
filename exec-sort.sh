#!/usr/bin/env bash
# Examples of "sort"

#echo '[1,3,2]' | jq 'sort'

echo '{"items": [2,1]}' | jq '.items |= sort'
