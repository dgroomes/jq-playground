#!/usr/bin/env bash
# Trying to learn "reduce"

echo '[1,2,3]' | jq 'reduce .[] as $a ("0"; . + ($a | tostring))'