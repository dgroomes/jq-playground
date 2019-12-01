#!/usr/bin/env bash

echo '"hello"' | jq 'include "mylib"; msg_part_one | msg_part_two | msg_part_three'