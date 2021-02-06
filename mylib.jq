# This file contains custom jq functions and variables that I've defined. Using '.jq' files is an effective way
# to work with jq especially when you require a non-trivial jq expression. It's easier to iteratively develop a
# sophisticated jq expression by writing it in a file instead of writing it inline in a shell script where you need to
# deal with additional string escaping.

def msg_part_one: " from";

def msg_part_two: " my";

def msg_part_three: " library!";

# A toy function that just applies a function on some object
def exec(fn; target): target | fn;

# A prototype for an "execute a pipeline of functions" function
# This is a prototype because applies exactly two functions instead of a variable number of functions. This implementation
# needs to be improved to handle the generic case of a variable number of functions.
def exec_fns(fns; target): target | fns[0] | fns[1];

# Enrich an object.
# Returns a combination of the original input object with the result of a function applied on the input object
def enrich(fn):
  . + (. | fn);
  
# Like "enrich" but with an array (rather, a pipeline!) of functions
# NOTE: But, are they applied in order?
def enrich_pipeline(fns):
    reduce fns[] as $fn (.; enrich($fn));

def stage_two: { stage_two: (.stage_one + 1) };

def stage_three: { stage_three: (.stage_two + 1) };

def accumulate_until_ten(f):
  { "result": 0 } as $init |
  foreach .[] as $row
    ($init;
     { result: (.result + ($row | f)) } ;
     . as $res | $row | (f = $res) | if $res.result == 10 then . else empty end);

def accumulate_inverted(fns):
  0 as $init | 
  foreach fns[] as $fn ($init; exec($fn; 0); .);


def my_add_one:
  . + 1;

def my_add_two: . + 2;

def my_add_three: . + 3;

def my_add_four: . + 4;

# Like my_add_one but adds to the value passed as an argument instead of adding to the input.
# In fact, it complete ignores the input.
def my_add_one_n(n):
  n + 1;

# Like exec, but trying to curry 
def exec_arg0(fn; target) : target | fn;

def dispatch_inverted(data_fns):
  0 as $init |
  foreach data_fns[] as $datum ($init; . + $datum[0]; .);

# This kind of works
def exec_fns_foreach(fns; subject):
  [range(0; (fns | length))] |
  foreach .[] as $entry (subject; . | fns[$entry]; .);

# SUCCESS
def exec_fns_foreach_obj(fns; subject):
  [range(0; (fns | length))] |
  foreach .[] as $entry (subject; . + (. | fns[$entry]); .);

# Get the first field in an object
def first_field: (. | keys[0]) as $firstfield | .[$firstfield];

# Use regex and capturing groups to extract the individual words from a string containing exactly three words
# See https://stedolan.github.io/jq/manual/#RegularexpressionsPCRE
def extract_words:
  capture("(?<first_word>[a-z]+) (?<second_word>[a-z]+) (?<third_word>[a-z]+)");

# Like 'extract_words' but using the extended regex format via the "x" flag so that we can break up the regex for
# readability (in theory, this regex is more readable but it's up to the reader to decide if it is indeed any better).
def extract_words_extended:
  capture("(?<first_word>[a-z]+)\\s
           (?<second_word>[a-z]+)\\s
           (?<third_word>[a-z]+)"; "x");
