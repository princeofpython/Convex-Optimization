clear all;
Ct = [1 -0.76 0.07 -0.96; -0.76 1 0.18 0.07; 0.07 0.18 1 0.41; -0.96 0.07 0.41 1];
cvx_begin 
    variable X(4,4) symmetric semidefinite;
    minimize norm(Ct-X,'fro'); 
    subject to
    X(1,1) == 1;
    X(2,2) == 1;
    X(3,3) == 1;
    X(4,4) == 1;
cvx_end