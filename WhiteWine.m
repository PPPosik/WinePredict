%% load
load('wine.mat');
% WhiteWine(1,:) = [];

%% 5 6 7
tabulate(WhiteWine.Quality)
t = table2array(WhiteWine);

upper5 = WhiteWine.Quality >= 5;
until7 = WhiteWine.Quality <= 7;
mask = upper5 & until7;
tMask = t(mask, :);
tblMask = array2table(tMask);

tblMask.Properties.VariableNames{1} = 'FixAcid';
tblMask.Properties.VariableNames{2} = 'VolAcid';
tblMask.Properties.VariableNames{3} = 'CitAcid';
tblMask.Properties.VariableNames{4} = 'ResSugar';
tblMask.Properties.VariableNames{5} = 'Chlorides';
tblMask.Properties.VariableNames{6} = 'FreeS02';
tblMask.Properties.VariableNames{7} = 'TotalS02';
tblMask.Properties.VariableNames{8} = 'Density';
tblMask.Properties.VariableNames{9} = 'pH';
tblMask.Properties.VariableNames{10} = 'Sulphates';
tblMask.Properties.VariableNames{11} = 'Alcohol';
tblMask.Properties.VariableNames{12} = 'Quality';

%% extract
response = WhiteWine.Quality;
measurement = WhiteWine{:, 1:11};

%% trainRegressionModel567 test
% model567 = trainRegressionModel567(tblMask);
load('model567.mat');
yfit = model567.predictFcn(WhiteWine);
error = yfit - WhiteWine.Quality;
MSE = mean(error.^2);
RMSE = sqrt(MSE);

%% cvpartition
% c = cvpartition(response, 'HoldOut', 0.3);
% 
% dataTrain = measurements(c.training, :);
% dataValid = measurements(c.test, :);
% classTrain = response(c.training);
% classValid = response(c.test);

%% meanTest
% m = WhiteWine(:, 1:3);
% vecm = table2array(m);
% meanAcid = mean(vecm, 2);
% meanAcid = array2table(meanAcid);
% wine4toend = WhiteWine(:, 4:end);
% acidMean = [meanAcid wine4toend];

%% plot
% f1 = figure
corrplot(WhiteWine)
% f2 = figure
% plotmatrix(arrWhiteWine)
% f3 = figure
% plot(histogram)

% subplot(3,4,1)
% histogram(WhiteWine.FixAcid)
% xlabel('FixAcid')
% subplot(3,4,2)
% histogram(WhiteWine.VolAcid)
% xlabel('VolAcid')
% subplot(3,4,3)
% histogram(WhiteWine.CitAcid)
% xlabel('CitAcid')
% subplot(3,4,4)
% histogram(WhiteWine.ResSugar)
% xlabel('ResSugar')
% subplot(3,4,5)
% histogram(WhiteWine.Chlorides)
% xlabel('Chlorides')
% subplot(3,4,6)
% histogram(WhiteWine.FreeS02)
% xlabel('FreeS02')
% subplot(3,4,7)
% histogram(WhiteWine.TotalS02)
% xlabel('TotalS02')
% subplot(3,4,8)
% histogram(WhiteWine.Density)
% xlabel('Density')
% subplot(3,4,9)
% histogram(WhiteWine.pH)
% xlabel('pH')
% subplot(3,4,10)
% histogram(WhiteWine.Sulphates)
% xlabel('Sulphates')
% subplot(3,4,11)
% histogram(WhiteWine.Alcohol)
% xlabel('Alcohol')
% subplot(3,4,12)
% histogram(WhiteWine.Quality)
% xlabel('Quality')




