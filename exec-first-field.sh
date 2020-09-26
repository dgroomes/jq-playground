#!/usr/bin/env bash
# Get the first field from an object.

jq 'include "mylib"; . | first_field' << EOF
{
  "a_field": "a_value",
  "b_field": "b_value"
}
EOF
