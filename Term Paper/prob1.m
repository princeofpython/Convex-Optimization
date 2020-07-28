a = readtable('./2d_dataset_1.csv');
a = table2array(a);
y = a(find(a(:,1)==1),2:3);
x = a(find(a(:,1)==0),2:3);
cvx_begin
    variables p(2) q  t;
    maximize t;
    subject to
    x*p - q >= t;
    y*p - q <= -t;
    norm(p, 2) <= 1;
cvx_end
gscatter(a(:,2), a(:,3), a(:, 1));
hold on;
xx = 1:1000;
yy= (-p(1)* xx + q)/p(2);
plot(xx,yy)

    
    
    
    


