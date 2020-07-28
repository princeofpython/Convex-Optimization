clear all;
A = [-1 -1; -1 1; 1 -1; 2 1];
b = [1/2; 2; 2; 4];
c = [-2; -1];

cvx_begin
    variable x(4) nonnegative;
    maximize (- b'*x +min(0,A(:,1)'*x + c(1))+min(0,A(:,2)'*x + c(2)));
cvx_end