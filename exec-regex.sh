#!/usr/bin/env bash
# Examples using a regular expression in jq

jq --raw-input 'include "mylib"; . | extract_words' << EOF
hello there friend
EOF

jq --raw-input 'include "mylib"; . | extract_words_extended' << EOF
saying hello again
EOF
