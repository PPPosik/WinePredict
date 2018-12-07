%% load
load('wine.mat');
% load('wineTest.mat');
% load('Qualityans.mat');
% WhiteWine(1,:) = [];

%% cvpartition
response = WhiteWine.Quality;
measurement = WhiteWine{:, 1:11};

sz = size(measurement);
width = sz(1,1);
height = sz(1,2);

c = cvpartition(response, 'HoldOut', 0.2);

dataTrain = measurement(c.training, :);
dataValid = measurement(c.test, :);
classTrain = response(c.training);
classValid = response(c.test);

%% normalization
nrTrain = normalize(dataTrain, 'range');
nrValid = normalize(dataValid, 'range');

%% normalization all
arr = table2array(WhiteWine);
arrResponse = arr(:, 12);
arrMes = arr(:, 1:11);
nrArrMes = normalize(arrMes, 'range');
nrWine = [nrArrMes arrResponse];
% y1 = x1 * dataValid(:,1);
% y2 = x2 * dataValid(:,2);
% y3 = x3 * dataValid(:,3);
% y4 = x4 * dataValid(:,4);
% y5 = x5 * dataValid(:,5);
% y6 = x6 * dataValid(:,6);
% y7 = x7 * dataValid(:,7);
% y8 = x8 * dataValid(:,8);
% y9 = x9 * dataValid(:,9);
% y10 = x10 * dataValid(:,10);
% y11 = x11 * dataValid(:,11);
% ttt = [y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 y11];
nrTbWine = array2table(nrWine);
% 
% nrTbWine.Properties.VariableNames{1} = 'FixAcid';
% nrTbWine.Properties.VariableNames{2} = 'VolAcid';
% nrTbWine.Properties.VariableNames{3} = 'CitAcid';
% nrTbWine.Properties.VariableNames{4} = 'ResSugar';
% nrTbWine.Properties.VariableNames{5} = 'Chlorides';
% nrTbWine.Properties.VariableNames{6} = 'FreeS02';
% nrTbWine.Properties.VariableNames{7} = 'TotalS02';
% nrTbWine.Properties.VariableNames{8} = 'Density';
% nrTbWine.Properties.VariableNames{9} = 'pH';
% nrTbWine.Properties.VariableNames{10} = 'Sulphates';
% nrTbWine.Properties.VariableNames{11} = 'Alcohol';
% nrTbWine.Properties.VariableNames{12} = 'Quality';

%% OLS
x1 = lscov(WhiteWine.FixAcid, WhiteWine.Quality);
a1 = x1 * WhiteWine.FixAcid;
x2 = lscov(WhiteWine.VolAcid, WhiteWine.Quality);
a2 = x2 * WhiteWine.VolAcid;
x3 = lscov(WhiteWine.CitAcid, WhiteWine.Quality);
a3 = x3 * WhiteWine.CitAcid;
x4 = lscov(WhiteWine.ResSugar, WhiteWine.Quality);
a4 = x4 * WhiteWine.ResSugar;
x5 = lscov(WhiteWine.Chlorides, WhiteWine.Quality);
a5 = x5 * WhiteWine.Chlorides;
x6 = lscov(WhiteWine.FreeS02, WhiteWine.Quality);
a6 = x6 * WhiteWine.FreeS02;
x7 = lscov(WhiteWine.TotalS02, WhiteWine.Quality);
a7 = x7 * WhiteWine.TotalS02;
x8 = lscov(WhiteWine.Density, WhiteWine.Quality);
a8 = x8 * WhiteWine.Density;
x9 = lscov(WhiteWine.pH, WhiteWine.Quality);
a9 = x9 * WhiteWine.pH;
x10 = lscov(WhiteWine.Sulphates, WhiteWine.Quality);
a10 = x10 * WhiteWine.Sulphates;
x11 = lscov(WhiteWine.Alcohol, WhiteWine.Quality);
a11 = x11 * WhiteWine.Alcohol;

% x1 = lscov(dataTrain(:,1), classTrain(:,1));
% a1 = x1 * dataTrain(:,1);
% x2 = lscov(dataTrain(:,2), classTrain(:,1));
% a2 = x2 * dataTrain(:,2);
% x3 = lscov(dataTrain(:,3), classTrain(:,1));
% a3 = x3 * dataTrain(:,3);
% x4 = lscov(dataTrain(:,4), classTrain(:,1));
% a4 = x4 * dataTrain(:,4);
% x5 = lscov(dataTrain(:,5), classTrain(:,1));
% a5 = x5 * dataTrain(:,5);
% x6 = lscov(dataTrain(:,6), classTrain(:,1));
% a6 = x6 * dataTrain(:,6);
% x7 = lscov(dataTrain(:,7), classTrain(:,1));
% a7 = x7 * dataTrain(:,7);
% x8 = lscov(dataTrain(:,8), classTrain(:,1));
% a8 = x8 * dataTrain(:,8);
% x9 = lscov(dataTrain(:,9), classTrain(:,1));
% a9 = x9 * dataTrain(:,9);
% x10 = lscov(dataTrain(:,10), classTrain(:,1));
% a10 = x10 * dataTrain(:,10);
% x11 = lscov(dataTrain(:,11), classTrain(:,1));
% a11 = x11 * dataTrain(:,11);

% arrOls = [a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 classTrain];
arrOls = [a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 response];

tbOls = array2table(arrOls);
tbOls.Properties.VariableNames{1} = 'FixAcid';
tbOls.Properties.VariableNames{2} = 'VolAcid';
tbOls.Properties.VariableNames{3} = 'CitAcid';
tbOls.Properties.VariableNames{4} = 'ResSugar';
tbOls.Properties.VariableNames{5} = 'Chlorides';
tbOls.Properties.VariableNames{6} = 'FreeS02';
tbOls.Properties.VariableNames{7} = 'TotalS02';
tbOls.Properties.VariableNames{8} = 'Density';
tbOls.Properties.VariableNames{9} = 'pH';
tbOls.Properties.VariableNames{10} = 'Sulphates';
tbOls.Properties.VariableNames{11} = 'Alcohol';
tbOls.Properties.VariableNames{12} = 'Quality';
%% box plot
boxplot(nrArrMes);

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
% szTrain = size(dataTrain);
% szValid = size(dataValid);
% 
% widthTrain = szTrain(1,1);
% heightTrain = szTrain(1,2);
% 
% widthValid = szValid(1,1);
% heightValid = szValid(1,2);
% 
% for r = 1:widthTrain
%     if classTrain(r,1) < 5
%         classTrain(r,1) = 5;
%     end
%     if classTrain(r,1) > 7
%         classTrain(r,1) = 7;
%     end
% end

data = [dataValid(:,2) dataValid(:,3) dataValid(:,10) dataValid(:,11)];
dataTable = array2table(data);
dataTable.Properties.VariableNames{1} = 'VolAcid';
dataTable.Properties.VariableNames{2} = 'CitAcid';
dataTable.Properties.VariableNames{3} = 'Sulphates';
dataTable.Properties.VariableNames{4} = 'Alcohol';
% dataTable.Properties.VariableNames{1} = 'FixAcid';
% dataTable.Properties.VariableNames{2} = 'VolAcid';
% dataTable.Properties.VariableNames{3} = 'CitAcid';
% dataTable.Properties.VariableNames{4} = 'ResSugar';
% dataTable.Properties.VariableNames{5} = 'Chlorides';
% dataTable.Properties.VariableNames{6} = 'FreeS02';
% dataTable.Properties.VariableNames{7} = 'TotalS02';
% dataTable.Properties.VariableNames{8} = 'Density';
% dataTable.Properties.VariableNames{9} = 'pH';
% dataTable.Properties.VariableNames{10} = 'Sulphates';
% dataTable.Properties.VariableNames{11} = 'Alcohol';
% dataTable.Properties.VariableNames{12} = 'Quality';

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

%% trainRegressionModel567 test
% model567 = trainRegressionModel567(tblMask);
% load('model567.mat');
% yfit = model567.predictFcn(WhiteWine);
% error = yfit - WhiteWine.Quality;
% MSE = mean(error.^2);
% RMSE = sqrt(MSE);

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

plotMatrix = nrWine;
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


