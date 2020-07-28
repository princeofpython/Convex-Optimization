clear all;
a = readtable('./2d_dataset_4');

a = table2array(a);
z = a(find(a(:,3)==2),1:2);
y = a(find(a(:,3)==1),1:2);
x = a(find(a(:,3)==0),1:2);

gscatter(a(:,1), a(:,2), a(:, 3));


cvx_begin
variables u(size(x,1)) v(size(y,1)) w(size(z,1));
variables p(2) q  ;
minimize sum(u(:)) + sum(v(:)) + sum(w(:));
subject to
    x*p - q >= 1 - u;
    y*p - q <= -(1 - v);
    z*p - q <= -(1 - w);
    u >= 0;
    v >= 0;
    w >= 0;
cvx_end

hold on;
xx = 1:100;
yy= (-p(1)* xx + q)/p(2);

plot(xx,yy,'r')

cvx_begin
variables u(size(x,1)) v(size(y,1)) w(size(z,1));
variables p(2) q  ;
minimize sum(u(:)) + sum(v(:)) + sum(w(:));
subject to
    y*p - q >= 1 - v;
    x*p - q <= -(1 - u);
    z*p - q <= -(1 - w);
    u >= 0;
    v >= 0;
    w >= 0;
cvx_end

hold on;
yy= (-p(1)* xx + q)/p(2);

plot(xx,yy,'g')
cvx_begin
variables u(size(x,1)) v(size(y,1)) w(size(z,1));
variables p(2) q  ;
minimize sum(u(:)) + sum(v(:)) + sum(w(:));
subject to
    z*p - q >= 1 - w;
    x*p - q <= -(1 - u);
    y*p - q <= -(1 - v);
    u >= 0;
    v >= 0;
    w >= 0;
cvx_end

hold on;
yy= (-p(1)* xx + q)/p(2);

plot(xx,yy,'b')

