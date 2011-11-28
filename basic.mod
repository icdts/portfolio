set I;
set J;
param B {I} >= 0; # Right hand side of constraint inequalities
param C {J};      # Objective function coefficients
param A {I,J};      # Left hand side variable coefficients
var X{J} >= 0;    # Variables with positivity constraints

maximize Z:
 sum {j in J} C[j]*X[j];
subject to constraints {i in I}:
 sum {j in J} A[i,j]*X[j]<=B[i];
end;
