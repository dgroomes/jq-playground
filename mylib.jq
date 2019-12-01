def msg_part_one: " from";

def msg_part_two: " my";

def msg_part_three: " library!";

def exec(fn; target): target | fn;

def exec_fns(fns; target): target | fns[0] | fns[1];

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