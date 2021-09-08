# cryptopredict

The aim of this project is for me to gain some practical experience with ML techniques while researching and working on another topic I am interested in - and perhaps accurate predictions leading to $$$$. 

Implementation

Algorithms
gradient descent
backslash

Evaulation and optimization
In general I used 60% of the data for training, 20% for validation and 20% for testing.
I use R2 and RMSE to evaluate how well the model does. In addition I also implemented a modification to RMSE, and I compute the root of the squared mean percentage errors. This expression is more indicative of how much we can trust our predictions, since we are primarily interested in percentage movements when trading.

Backslash

Featureset_1
Month, Day of Month, Price from previous day, Market Cap from previous day, Volume from previous day
Data is kept sorted -> we want to identify patterns, and these features do not bear indication of historic data when shuffled

Training error
R2 = 0.99443
RMSE = 1.3768
RMSPE =  4.4798%

Validation error
R2 = 0.98144
RMSE = 131.4077
RMSPE =  2.9718%

Test error
R2 = 0.99415
RMSE = 392.9789
RMSPE =  3.458%

TODO: determine bias or variance?
