#### Params and Sets
# set representing the hours that wallymart must staff clerks
set HOURS := {0..23};
# set representing the number of clerks that must be staffed during certain hours 
param DEMAND {t in HOURS};

#### Decision variables
# Number of clerks to start at hour t
var c {t in HOURS} >= 0;

#### Objective Function
# Minimize the cost for clerks
minimize cost: 27*c[0] + 36 * sum{t in 1..3} c[t] + 27 * sum{t in 4..23} c[t];

#### Constraints
## Following constraints ensure demand at hour t is met

# Hardcoded constraint for hour 0
subject to clerks_0: c[0] >= DEMAND[0];

# Hardcoded constraint for hour 1
subject to clerks_1: c[1] + c[0] >= DEMAND[1];

# Generic constraint for hour t
subject to clerks_t: c[t] + c[t-1] + c[t-2] >= DEMAND[t];
