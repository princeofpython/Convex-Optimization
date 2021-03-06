clear all;
a = readtable('./2d_dataset_2.csv');

a = table2array(a);
y = a(find(a(:,1)==1),2:3);
x = a(find(a(:,1)==0),2:3);

gscatter(a(:,2), a(:,3), a(:, 1));
hold on;


cvx_begin
variables u(size(x,1)) v(size(y,1));
variables c d e f g r h k p q ;
minimize sum(u(:)) + sum(v(:));
subject to
    c * x(:,1).^2 + d * x(:,2).^2+ e*x(:,1).*(x(:,2)) + f *x(:,1) + g * x(:,2) + h * x(:,1).^3 + p * x(:,2).^3+ q*x(:,1).*(x(:,2)).*x(:,1) + k*x(:,1).*(x(:,2)).*(x(:,2)) + r >= 10 - u;
    c * y(:,1).^2 + d * y(:,2).^2+ e*y(:,1).*(y(:,2)) +  f *y(:,1) + g * y(:,2) +h * y(:,1).^3 + p * y(:,2).^3+ q*y(:,1).*(y(:,2)).*y(:,1) + k*y(:,1).*(y(:,2)).*(y(:,2)) + r <= -(10- v);
    u >= 0;
    v >= 0;
cvx_end



syms X Y
fu(X,Y) = c * X^2 + d * Y^2+ e*X*Y +f * X + g * Y + r + h * X^3 + p* Y^3 + k* X * Y^2 + q * X^2 * Y;

fc = fcontour(fu);
fc.LevelList = [0 0];
