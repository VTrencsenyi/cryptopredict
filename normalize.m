function X_hat = normalize(X)
%UNTITLED Normalize features to 0 mean and 1 variance
%   For features to be more comparable, they all have to be in the same
%   range and 0 mean.

m = size(X, 1); %number of examples

%these produce row vectors
mu = mean(X);
sigma = std(X);

%compose matrices
mu_matrix = ones(m, 1) * mu;
sigma_matrix = ones(m, 1) * sigma;

%calc the normalized X
X_hat = (X - mu_matrix) ./ sigma_matrix;

end

