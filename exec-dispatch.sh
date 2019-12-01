#!/usr/bin/env bash
# In what ways can I use higher order functions? When can I pass a function to be evaluated, or dispatched to, later?
# Contrarily, when does jq eagerly evaluate these functions?
#
# Answer, seems like when a function body needs the input, it evalutes early? But when not, you can evaluate it later?

# echo '"ignored"' | jq 'include "mylib"; my_add_one_n(3)'

# This does work
#echo '"ignored"' | jq 'include "mylib"; exec(my_add_one; 2)'

# This does work
echo '"ignored"' | jq 'include "mylib"; exec_fns([my_add_one, my_add_two]; 10)'

# This doesn't work
#echo '"ignored"' | jq 'include "mylib"; exec_arg0(999 | my_add_one_n)'