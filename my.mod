set stocks := 1..10;
set time := 1..86;

param R {time,stocks};

param reward { j in stocks } := (1/T)*(sum { t in time } R[t,j]) ;

var x{stocks} >= 0;
var y{time} >= 0;


maximize Z:
	(1/T)*( sum { t in time, j in stocks } x[j] * R[t,j] );


