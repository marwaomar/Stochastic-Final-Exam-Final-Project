x = [0.866236;
0.742524;
-0.40805;
-0.99432;
-0.20552;
0.867497;
0.740828;
-0.41035;
-0.99404;
-0.20304;
0.868752;
0.739127;
-0.41266;
-0.99377;
-0.20057;
0.870002
];
y = [0.35940;
0.3101;
-0.6747;
-0.76200;
-0.00327;
0.91948;
-0.3192;
0.17053;
-0.5523;
0.50253;
-0.4898;
0.01191;
0.39815;
0.78180;
0.9185;
0.09443
];

dataClass1 = detrend(x,'constant');
%first Channel from class 2
dataClass2 = detrend(y,'constant');
data = [dataClass1, dataClass2];
%Test data from class 1
z = [0.65163;
0.07668;
0.992269;
-0.114643;
-0.786694;0.923796;
-0.990731;
0.549820;
0.737389;
-0.831128;
-0.2004347;
-0.13717;
0.600137;
-0.48026;
-0.20043;
0.634606
];
testData = detrend(z,'constant');
selectedModels = cell(2,1);
models = cell(2,3);
aic_AR = zeros(2,1);
aic_MA = zeros(2,1);
aic_ARMA = zeros(2,1);
for i = 1:2
[model_MA, ~, logL_MA] = estimate(arima(0,0,4),data(:,i));
[model_AR, ~, logL_AR] = estimate(arima(5,0,0),data(:,i));
[model_ARMA, ~, logL_ARMA] = estimate(arima(3,0,4),data(:,i));

models = {model_MA, model_AR, model_ARMA};
aic_MA(i,1) = 2*4 - 2*logL_MA;
aic_AR(i,1) = 2*5 - 2*logL_AR;
aic_ARMA(i,1) = 2*7 - 2*logL_ARMA;

[AicVal, idx] = min([aic_MA(i,1), aic_AR(i,1), aic_ARMA(i,1)]);
selectedModels{i} = models{idx};

display(AicVal)
display(idx)
end
% Initialize an array to be updated with likelihood values for each model

likelihoodVals = zeros(1,2);
%% [3] Hypothesis test
for i = 1:2
% Calculate likelihood estimate for testData using the selected model 

% class
[~,~,logL] = estimate(selectedModels{i},testData);
likelihoodVals(i) = logL;
end
%Select class with maximum likelihood value
[maxLL, testDataClass] = max(likelihoodVals);
display(maxLL)
display(testDataClass)
display(selectedModels{1})
display(selectedModels{2})
