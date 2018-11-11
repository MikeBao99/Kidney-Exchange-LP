param num_rows;

set R := 1 .. num_rows;

param E {R, R};

var X {R, R} binary;

maximize Objective: sum{(i,j) in {R, R}} X[i,j];

subject to Donor {i in R}: sum{j in R} X[i,j] <= 1;

subject to Recipient {j in R}: sum{i in R} X[i,j] <= 1;

subject to Two {(i,j) in {R, R}}: X[i,j] = X[j,i];

subject to Valid {(i,j) in {R, R}}: X[i,j] <= E[i,j];