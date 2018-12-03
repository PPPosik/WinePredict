%% load
load('wine.mat');

%% cvpartition
response = WhiteWine.Quality;
measurement = WhiteWine{:, 1:11};

c = cvpartition(response, 'HoldOut', 0.2);

dataTrain = measurement(c.training, :);
dataValid = measurement(c.test, :);
classTrain = response(c.training);
classValid = response(c.test);

szTrain = size(dataTrain);
szValid = size(dataValid);
widthTrain = szTrain(1,1);
heightTrain = szTrain(1,2);
widthValid = szValid(1,1);
heightValid = szValid(1,2);

%% dataValid table
for r=1:widthValid
    if dataValid(r:6) < 50
        dataValid(r:7) = 0;
    end
end

tblValid = array2table(dataValid);

tblValid.Properties.VariableNames{1} = 'FixAcid';
tblValid.Properties.VariableNames{2} = 'VolAcid';
tblValid.Properties.VariableNames{3} = 'CitAcid';
tblValid.Properties.VariableNames{4} = 'ResSugar';
tblValid.Properties.VariableNames{5} = 'Chlorides';
tblValid.Properties.VariableNames{6} = 'FreeS02';
tblValid.Properties.VariableNames{7} = 'TotalS02';
tblValid.Properties.VariableNames{8} = 'Density';
tblValid.Properties.VariableNames{9} = 'pH';
tblValid.Properties.VariableNames{10} = 'Sulphates';
tblValid.Properties.VariableNames{11} = 'Alcohol';


%%
arrWine = table2array(WhiteWine);
for r=1:4898 
    if arrWine(r:6) < 50
        arrWine(r:7) = 0;
    end
end

% for r = 1:4898
%     if arrWine(r,12) < 5
%         arrWine(r,12) = 5;
%     end
%     if arrWine(r,12) > 7
%         arrWine(r,12) = 7;
%     end
% end

tblWine = array2table(arrWine);

tblWine.Properties.VariableNames{1} = 'FixAcid';
tblWine.Properties.VariableNames{2} = 'VolAcid';
tblWine.Properties.VariableNames{3} = 'CitAcid';
tblWine.Properties.VariableNames{4} = 'ResSugar';
tblWine.Properties.VariableNames{5} = 'Chlorides';
tblWine.Properties.VariableNames{6} = 'FreeS02';
tblWine.Properties.VariableNames{7} = 'TotalS02';
tblWine.Properties.VariableNames{8} = 'Density';
tblWine.Properties.VariableNames{9} = 'pH';
tblWine.Properties.VariableNames{10} = 'Sulphates';
tblWine.Properties.VariableNames{11} = 'Alcohol';
tblWine.Properties.VariableNames{12} = 'Quality';

%% normalization // no
% nrTrain = normalize(dataTrain, 'range');
% nrValid = normalize(dataValid, 'range');

% aa = normalize(measurement);
% bb = [aa response];

tblValid = array2table(dataValid);

tblValid.Properties.VariableNames{1} = 'FixAcid';
tblValid.Properties.VariableNames{2} = 'VolAcid';
tblValid.Properties.VariableNames{3} = 'CitAcid';
tblValid.Properties.VariableNames{4} = 'ResSugar';
tblValid.Properties.VariableNames{5} = 'Chlorides';
tblValid.Properties.VariableNames{6} = 'FreeS02';
tblValid.Properties.VariableNames{7} = 'TotalS02';
tblValid.Properties.VariableNames{8} = 'Density';
tblValid.Properties.VariableNames{9} = 'pH';
tblValid.Properties.VariableNames{10} = 'Sulphates';
tblValid.Properties.VariableNames{11} = 'Alcohol';
% tblValid.Properties.VariableNames{12} = 'Quality';
%% 5 6 7
class567 = classTrain;

for r = 1:widthTrain
    if class567(r,1) < 5
        class567(r,1) = 5;
    end
    if class567(r,1) > 7
        class567(r,1) = 7;
    end
end

% for r=1:widthTrain
%     if dataTrain(r:6) < 50
%         dataTrain(r:7) = 0;
%     end
% end

train = [dataTrain class567];
tblMask = array2table(train);

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

%% OLS
nrTrain = normalize(dataTrain, 'range');

x1 = lscov(nrTrain(:,1), tblMask.Quality);
a1 = x1 * nrTrain(:,1);
x2 = lscov(nrTrain(:,2), tblMask.Quality);
a2 = x2 * nrTrain(:,2);
x3 = lscov(nrTrain(:,3), tblMask.Quality);
a3 = x3 * nrTrain(:,3);
x4 = lscov(nrTrain(:,4), tblMask.Quality);
a4 = x4 * nrTrain(:,4);
x5 = lscov(nrTrain(:,5), tblMask.Quality);
a5 = x5 * nrTrain(:,5);
x6 = lscov(nrTrain(:,6), tblMask.Quality);
a6 = x6 * nrTrain(:,6);
x7 = lscov(nrTrain(:,7), tblMask.Quality);
a7 = x7 * nrTrain(:,7);
x8 = lscov(nrTrain(:,8), tblMask.Quality);
a8 = x8 * nrTrain(:,8);
x9 = lscov(nrTrain(:,9), tblMask.Quality);
a9 = x9 * nrTrain(:,9);
x10 = lscov(nrTrain(:,10), tblMask.Quality);
a10 = x10 * nrTrain(:,10);
x11 = lscov(nrTrain(:,11), tblMask.Quality);
a11 = x11 * nrTrain(:,11);

ols = [a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11];
olsMean = mean(ols, 2);


