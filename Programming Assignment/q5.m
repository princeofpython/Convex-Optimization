clear all;

% Minimizing Norm
data = load('Q5_data.mat');
X = data.A;
b = sin(data.a)';
cvx_begin
    variables y(4);
    minimize (norm(X*y-b,1));
cvx_end

% LP
cvx_begin
    variable a(4) nonnegative;
    variable c(4) nonnegative;
    variable z(20) nonnegative;
    minimize sum(z(:)); 
    subject to 
    X*(a-c)-b <= z;
    -X*(a-c)+b <= z; 
cvx_end

%Plot
plot(X(:,2),b);
hold on;
grid on;
plot(X(:,2),X*(a-c));
legend('sin(x)','f(x)')
title('sin(x) vs f(x)')
xlabel('x')
ylabel('y')