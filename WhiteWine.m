%% load
load('wine.mat');
load('wineTest.mat');
load('Qualityans.mat');
% WhiteWine(1,:) = [];

%% Test 1000
load('Qualityans.mat')
ans2 = xlsread('Myans.xlsx');
error2 = Quailty100 - ans2;
MSE2 = mean(error2.^2);
RMSE2 = sqrt(MSE2);

ans1 = xlsread('WinePredict.xlsx');
error1 = Quailty100 - ans1;
MSE1 = mean(error1.^2);
RMSE1 = sqrt(MSE1);

%% 5 6 7
tabulate(WhiteWine.Quality);
t = table2array(WhiteWine);

for r = 1:width
    if t(r,end) < 5
        t(r,end) = 5;
    end
    if t(r,end) > 7
        t(r,end) = 7;
    end
end

% upper5 = WhiteWine.Quality >= 5;
% until7 = WhiteWine.Quality <= 7;
% mask = upper5 & until7;
% tMask = t(mask, :);
% tblMask = array2table(tMask);
tblMask = array2table(t);

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

%% hold out 0.25 Test
szTrain = size(dataTrain);
szValid = size(dataValid);

widthTrain = szTrain(1,1);
heightTrain = szTrain(1,2);

widthValid = szValid(1,1);
heightValid = szValid(1,2);

for r = 1:widthTrain
    if classTrain(r,1) < 5
        classTrain(r,1) = 5;
    end
    if classTrain(r,1) > 7
        classTrain(r,1) = 7;
    end
end

data = [dataTrain classTrain];
dataTable = array2table(data);
dataTable.Properties.VariableNames{1} = 'FixAcid';
dataTable.Properties.VariableNames{2} = 'VolAcid';
dataTable.Properties.VariableNames{3} = 'CitAcid';
dataTable.Properties.VariableNames{4} = 'ResSugar';
dataTable.Properties.VariableNames{5} = 'Chlorides';
dataTable.Properties.VariableNames{6} = 'FreeS02';
dataTable.Properties.VariableNames{7} = 'TotalS02';
dataTable.Properties.VariableNames{8} = 'Density';
dataTable.Properties.VariableNames{9} = 'pH';
dataTable.Properties.VariableNames{10} = 'Sulphates';
dataTable.Properties.VariableNames{11} = 'Alcohol';
dataTable.Properties.VariableNames{12} = 'Quality';

%%
dataValidTable = array2table(dataValid);
dataValidTable.Properties.VariableNames{1} = 'FixAcid';
dataValidTable.Properties.VariableNames{2} = 'VolAcid';
dataValidTable.Properties.VariableNames{3} = 'CitAcid';
dataValidTable.Properties.VariableNames{4} = 'ResSugar';
dataValidTable.Properties.VariableNames{5} = 'Chlorides';
dataValidTable.Properties.VariableNames{6} = 'FreeS02';
dataValidTable.Properties.VariableNames{7} = 'TotalS02';
dataValidTable.Properties.VariableNames{8} = 'Density';
dataValidTable.Properties.VariableNames{9} = 'pH';
dataValidTable.Properties.VariableNames{10} = 'Sulphates';
dataValidTable.Properties.VariableNames{11} = 'Alcohol';
dataValidTable.Properties.VariableNames{12} = 'Quality';



% mdl = trainRegressionModel567(dataTable);

% mdl = trainRegressionModel567(tblMask);
% pred = mdl.predictFcn(WhiteWineTest);
% error = pred - Quailty100;
% MSE = mean(error.^2);
% RMSE = sqrt(MSE);

%% extract
response = WhiteWine.Quality;
measurement = WhiteWine{:, 1:11};

sz = size(measurement);
width = sz(1,1);
height = sz(1,2);

%% trainRegressionModel567 test
% model567 = trainRegressionModel567(tblMask);
% load('model567.mat');
% yfit = model567.predictFcn(WhiteWine);
% error = yfit - WhiteWine.Quality;
% MSE = mean(error.^2);
% RMSE = sqrt(MSE);

%% cvpartition
c = cvpartition(response, 'HoldOut', 0.25);

dataTrain = measurement(c.training, :);
dataValid = measurement(c.test, :);
classTrain = response(c.training);
classValid = response(c.test);

%% mean test
% m = WhiteWine(:, 1:3);
% vecm = table2array(m);
% meanAcid = mean(vecm, 2);
% meanAcid = array2table(meanAcid);
% wine4toend = WhiteWine(:, 4:end);
% acidMean = [meanAcid wine4toend];

%% min max test
m = mean(measurement, 1);
tm = zeros(width,height);
for r = 1:width
    tm(r,:) = measurement(r,:) - m(1,:);
end

tmm = tm;
% for r = 1:width
%     for c = 1:height
%         if tmm(r, c) < 0
%             tmm(r,c) = tmm(r,c) * (-1);
%         end
%     end
% end

tmmMean = mean(tmm, 1);
tmmSort = tmm;
for c = 1:height
    sortTmp = sort(tmmSort(:,c));
    tmmSort(:,c) = sortTmp;
end
width10 = floor(width * 0.05);
width90 = floor(width * 0.95);

max = m;
min = m;
for c = 1:height
    max(1,c) = max(1,c) + tmmSort(width90,c);
    min(1,c) = min(1,c) + tmmSort(width10,c);
end

measurementTmp = measurement;
for r = 1:width
    for c = 1:height
        if (measurement(r,c) < min(1,c)) || (measurement(r,c) > max(1,c))
            if(tm(r,c) < 0)
                measurementTmp(r,c) = min(1,c);
            elseif(tm(r,c) > 0)
                measurementTmp(r,c) = max(1,c);
            end
        end
    end
end

wineMinMax = table(measurementTmp(:,1), measurementTmp(:,2), measurementTmp(:,3), measurementTmp(:,4), measurementTmp(:,5), measurementTmp(:,6), measurementTmp(:,7), measurementTmp(:,8), measurementTmp(:,9), measurementTmp(:,10), measurementTmp(:,11), response);
wineMinMax.Properties.VariableNames{1} = 'FixAcid';
wineMinMax.Properties.VariableNames{2} = 'VolAcid';
wineMinMax.Properties.VariableNames{3} = 'CitAcid';
wineMinMax.Properties.VariableNames{4} = 'ResSugar';
wineMinMax.Properties.VariableNames{5} = 'Chlorides';
wineMinMax.Properties.VariableNames{6} = 'FreeS02';
wineMinMax.Properties.VariableNames{7} = 'TotalS02';
wineMinMax.Properties.VariableNames{8} = 'Density';
wineMinMax.Properties.VariableNames{9} = 'pH';
wineMinMax.Properties.VariableNames{10} = 'Sulphates';
wineMinMax.Properties.VariableNames{11} = 'Alcohol';
wineMinMax.Properties.VariableNames{12} = 'Quality';

%% plot
% f1 = figure
% corrplot(WhiteWine)
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

plotMatrix = measurementTmp;
subplot(3,4,1)
histogram(plotMatrix(:,1))
xlabel('FixAcid')
subplot(3,4,2)
histogram(plotMatrix(:,2))
xlabel('VolAcid')
subplot(3,4,3)
histogram(plotMatrix(:,3))
xlabel('CitAcid')
subplot(3,4,4)
histogram(plotMatrix(:,4))
xlabel('ResSugar')
subplot(3,4,5)
histogram(plotMatrix(:,5))
xlabel('Chlorides')
subplot(3,4,6)
histogram(plotMatrix(:,6))
xlabel('FreeS02')
subplot(3,4,7)
histogram(plotMatrix(:,7))
xlabel('TotalS02')
subplot(3,4,8)
histogram(plotMatrix(:,8))
xlabel('Density')
subplot(3,4,9)
histogram(plotMatrix(:,9))
xlabel('pH')
subplot(3,4,10)
histogram(plotMatrix(:,10))
xlabel('Sulphates')
subplot(3,4,11)
histogram(plotMatrix(:,11))
xlabel('Alcohol')
subplot(3,4,12)
histogram(WhiteWine.Quality)
xlabel('Quality')


