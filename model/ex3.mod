param num_rows;

set P := 1 .. num_rows;
set Q := {(i,j) in {P,P}: i < j};
set R := {(i,j,k) in {P,P,P}: i<j && j<k};

param E {P, P};

var X {(i, j) in Q} binary;
var Y {(i, j, k) in R} binary;

maximize Objective: sum{(i,j) in Q} 2*X[i,j] + sum{(i,j,k) in R} 3*Y[i, j, k];

subject to compat2 {(i, j) in Q}: X[i, j] <= E[i, j]*E[j, i];
subject to compat3 {(i, j, k) in R}: Y[i, j, k] <= E[i, j]*E[j, k]*E[k, i]+E[j,i]*E[i,k]*E[k,j];
subject to limit {i in P}: sum{(i,j,k) in R} Y[i,j,k] + sum{(i,j) in Q} X[i,j] <= 1;