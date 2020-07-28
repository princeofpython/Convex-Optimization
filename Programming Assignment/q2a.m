clear all;

e = exp(1);
step = 0.1;
x = [-1 0.7];
grad = [1 1];
i = 1;
x_values = zeros(100,2);

while norm(grad) >= 0.01 
    grad(1) = e^(x(1)+3*x(2)-0.1)+e^(x(1)-3*x(2)-0.1)-e^(-x(1)-0.1);
    grad(2)= 3*e^(x(1)+3*x(2)-0.1)-3*e^(x(1)-3*x(2)-0.1); 
    
    x_values(i,:) = x;
    i = i+1;
    x = x - step*grad; 
end
x_values = x_values(1:i-1 , :);  %remove extra zeros
f_values = zeros(size(x_values,1),1);  % all optimal values
for i = 1:length(x_values)
    f_values(i) =e^(x_values(i, 1)+3*x_values(i, 2)-0.1)+e^(x_values(i, 1)-3*x_values(i, 2)-0.1)+e^(-x_values(i, 1)-0.1);
end
minf = e^(x(1)+3*x(2)-0.1)+e^(x(1)-3*x(2)-0.1)+e^(-x(1)-0.1);
fprintf('optimal f is %f and optimal x is %f %f\n',minf,x);

xx = -1.5:0.02:0;
m = size(xx, 1);
yy = -1:0.02:1;
[X,Y] = meshgrid(xx,yy);
F = e.^(X+3*Y-0.1*ones(m))+e.^(X-3*Y-0.1*ones(m))+e.^(-X-0.1*ones(m));
contour(X,Y,F,15,'-ok') % contour plot
xlabel('x_1')
ylabel('x_2')
title('Gradient Descent with \alpha = 0.1')
hold on;
    


plot(x_values(1,1),x_values(1, 2),'rx')
hold on
for i = 2:size(x_values, 1)
    plot(x_values(i,1),x_values(i,2),'rx')
    draw_line(x_values(i-1, :),x_values(i, :))
    hold on
end