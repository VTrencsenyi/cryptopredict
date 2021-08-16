function [theta, J_history] = gradientDescent(X, y, theta, alpha, n_iters)
%GRADIENTDESCENT is used to learn the parameters theta.
%   Perform "n_iters" steps of gradient descent using learning rate alpha.

m = size(y,1);
J_history = zeros(n_iters, 1);


for iter = 1:n_iters
    h = X * theta;
    gradient = ((transpose(X) * (h - y)) * alpha)*(1/m);
    theta = theta - gradient;
    
    J_history(iter) = computeCost(X, y, theta);
    
end

end

