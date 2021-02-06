#!/usr/bin/env bash
# if-then-else
# https://stedolan.github.io/jq/manual/#ConditionalsandComparisons

# This works. It is a simple example of 'if-then-else'. It returns "match".
jq --null-input '123 | if . == 123 then "match" else . end'

# This does not work. It outputs:
#   jq: error: syntax error, unexpected end (Unix shell quoting issues?) at <top-level>, line 1:
#   if . == 123 then "match" end
#   jq: error: Possibly unterminated 'if' statement at <top-level>, line 1:
#   if . == 123 then "match" end
#
# It should be equivalent to the previous statement because it omits the 'else' branch which should
# work since jq 1.6 thanks to this feature https://github.com/stedolan/jq/pull/1825. Similarly, the jq docs state:
#   That is, the 'else' branch is optional, and if absent is the same as '.'.
#
# So I'm not sure what's going on. When I do `jq -V` it outputs "jq-1.6".
jq --null-input '123 | if . == 123 then "match" end'
