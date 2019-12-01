def msg_part_one: " from";

def msg_part_two: " my";

def msg_part_three: " library!";

# Add the input the result of applying some function "fn" to the input
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

