function [X, y] = generateFeatures(data)
%GENERATEFEATURES transforms the data source into the matrix of features
%and the vector of observations / ground truth. 

%extract base features from the downloaded data
currentM = data(:,2);
currentDofM = data(:,3);
prevPrice = [data(1,4); data(1:end-1,4)];
prevCap = [data(1,5); data(1:end-1,5)];
prevVol = [data(1,6); data(1:end-1,6)];

%generate additional features
currentY = data(:,1);
date = datetime([currentY, currentM, currentDofM]);
currentDofY = day(date, 'dayofyear');
currentDofW = weekday(date);

%generate moving averages
SMA = generateSMAFeatures(prevPrice,50);

%compose feature matrix
X = [currentM, currentDofM, prevPrice, prevCap, prevVol, currentDofY, currentDofW, ...
    SMA];

%only keep features identified to be most important
X = X(:, 8:9);

%prices / ground truth
y = data(:,4);

end

