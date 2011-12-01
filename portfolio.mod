#---------------
# SETS
#--------------

set stocks;
set time := 1..4;

#-------------
# PARAMETERS
#-------------

param T;

param mu;

param R {time, stocks};

param reward { j in stocks } := (1/T)*(sum { t in time } R[t,j]) ;

#-----------
#VARIABLES
#----------

var x{stocks} >= 0;

var y{time} >= 0;

#---------
# OBJECTIVE
#---------

maximize return: 

   (1/T)*( sum { t in time, j in stocks } x[j] * R[t,j] ) ;

#-------------
# CONSTRAINTS
#------------

  upper { t in time }: sum { j in stocks } x[j]*(R[t,j]-reward[j]) <= y[t];

  lower { t in time }: sum { j in stocks } x[j]*(R[t,j]-reward[j]) >= -y[t];
 
  risk : (1/T)*( sum {t in time } y[t] ) <= mu;

  total : sum{j in stocks } x[j] = 1;

#------------
 
end;
