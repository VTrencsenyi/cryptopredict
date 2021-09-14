function SMA = generateSMAFeatures(prices,n)
%GENERATESMAFEATURES generates d number of SMA, increasing the range in
%each iteration up to n.
% Returns matrix SMA, with columns corresponding to SMA"n" feature vectors.

m = size(prices,1);
SMA = ones(m,n-1);

for i=2:n
    SMA(:,i-1) = movmean(prices,i);
end
end

