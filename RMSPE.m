function [rmspe, mx] = RMSPE(y, y_hat)
%RMSPE Root of squared mean percentage error
%   Summarizes the price prediction accuracy expressed as a percentage.

rmspe = mean((sqrt((y - y_hat).^2))./y) * 100;
mx = max((sqrt((y - y_hat).^2)./y))*100;

end

