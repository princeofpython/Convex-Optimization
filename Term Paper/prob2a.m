a = readtable('./2d_dataset_2.csv');

a = table2array(a);
y = a(find(a(:,1)==1),2:3);
x = a(find(a(:,1)==0),2:3);

gscatter(a(:,2), a(:,3), a(:, 1));

cvx_begin
variables u(size(x,1)) v(size(y,1));
variables p(2) q  ;
minimize sum(u(:)) + sum(v(:));
subject to
    x*p - q >= 1 - u;
    y*p - q <= -(1 - v);
    u >= 0;
    v >= 0;
cvx_end

gscatter(a(:,2), a(:,3), a(:, 1));
hold on;
xx = 1:1000;
yy= (-p(1)* xx + q)/p(2);

plot(xx,yy)