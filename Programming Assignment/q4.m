
clear all;
data = load('Q4_data.mat');

x = data.xs;
u = data.us;

cvx_begin
    variables A(10,10) B(10,4);
    minimize (norm(x(:,2:100)-A*x(:,1:99)-B*u,'fro'));
cvx_end


cards = zeros(51,1);
est_errors = zeros(51,1);
i = 1;
for lambda = 0:2:100 % changing lambda
    cvx_begin quiet
        variables A(10,10) B(10,4);
        minimize (norm(x(:,2:100)-A*x(:,1:99)-B*u,'fro') + lambda*(norm(A(:),1)+norm(B(:),1)));
    cvx_end
    est_errors(i) = norm(x(:,2:100)-A*x(:,1:99)-B*u,'fro'); @ all estimation errors
    cards(i) = length(find(abs(A) > 0.01)) + length(find(abs(B) > 0.01)); % all cardinalities
    
    fprintf('lambda = %d, cardinality is %d, est_error is %f\n',lambda, cards(i),est_errors(i));
    
    i = i+1;
end

plot(cards,est_errors,'-rx')
title('Estimation Error vs Cardinality')
xlabel('Cardinality')
ylabel('Estimation Error')
grid on;

% for optimal lambda = 12
cvx_begin
        variables A(10,10) B(10,4);
        minimize (norm(x(:,2:100)-A*x(:,1:99)-B*u,'fro') + 12*(norm(A(:),1)+norm(B(:),1)));
cvx_end