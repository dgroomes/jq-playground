def msg_part_one: " from";

def msg_part_two: " my";

def msg_part_three: " library!";

# Add the input the result of applying some function "fn" to the input
def enrich(fn):
  . + (. | fn);

# Like "enrich" but with an array (rather, a pipeline!) of functions that are applied
# in order
def enrich_pipeline(fns):
    # How to implement this? Below is a hardcoded solution expecting "fns" is an array of size three exactly...
    enrich(fns[0]) | enrich(fns[1]) | enrich(fns[2]);