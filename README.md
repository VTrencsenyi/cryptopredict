# cryptopredict

The aim of this project is for me to gain some practical experience with ML techniques while researching and working on another topic I am interested in - and perhaps accurate predictions leading to $$$$.

The goal is to be able to predict prices within 1% accuracy, thus making the predicton useful for trading.

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
These are the initial simple features, that we get straight from the downloaded data.
Data is kept sorted -> we want to identify patterns, and these features do not bear indication of historic data when shuffled.

| Data set | Training | Validation |   Test  |
|  :---:   |    :-:   |     :-:    |    :-:  |
|    R2    |  0.99443 |   0.98144  | 0.99415 |
|   RMSE   |  1.3768 |   131.4077   | 392.9789 |
|   RMSPE  |  4.4798% |   2.9718%   | 3.458% |

Featureset_2
Current day of year, current day of week, Price from previous day, Market Cap from previous day, Volume from previous day
Introducing day of year and day of week as features resulted in slightly worse scores - due to probable redundancy. The day of year and the day of week seem to be more indicative of trade behavior, replacing Month and day of Month resulted in a slight improvement.

| Data set | Training | Validation |   Test  |
|  :---:   |    :-:   |     :-:    |    :-:  |
|    R2    |  0.99442 |   0.98205  | 0.9943 |
|   RMSE   |  2.7093 |   121.5549   | 331.7271 |
|   RMSPE  |  4.345% |   2.8899%   | 3.3506% |

Featureset_3

