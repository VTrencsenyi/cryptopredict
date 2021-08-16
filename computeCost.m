function J = computeCost(X, y, theta)
%COMPUTECOST This function computes the cost J for linear regression
%   J is a metric for the difference between the ground thruth y and
%   the prediction using the parameters Theta.
%
%   X is an m x n matrix, where m is the n. of examples, and n is the n.
%   of features.
%   y is the m x 1 ground thruth vector.
%   Theta is the n x 1 parameter vector.

%h is our hyptohesis/prediction
m = size(X,1);

h = X * theta;
error = h - y;
error_sqr = error.^2;
J = (1/(2*m))*sum(error_sqr, 'all');

% One line solution:
%J = (X * theta - y)' * (X * theta - y) / 2 * m;

end

