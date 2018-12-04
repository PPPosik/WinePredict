%% load
load('wine.mat');

wine = WhiteWine;

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

%% residual sugar log10
for r=1:widthTrain
%     wine.ResSugar(r) = log10(WhiteWine.ResSugar(r));
      dataTrain(r,4) = log10(dataTrain(r,4));
end

for r=1:widthValid
    dataValid(r,4) = log10(dataValid(r,4));
end

%% outliers
% 요소별로 다르게 지워보기
% for r=1:4898
%     if WhiteWine.Density(r) < 0.98878
%         wine.Density(r) = 0.98878;
%     end
%     if WhiteWine.Density(r) > 1.0003
%         wine.Density(r) = 1.0003;
%     end
% end

wineAdj = zeros(widthTrain, 12);
validAdj = zeros(widthValid, 11);
for c=1:11
%     tmp = table2array(wine(:,c));
    p = prctile(dataTrain(:,c), [1 99]);
    
    for r=1:widthTrain
        if dataTrain(r,c) < p(1,1)
            dataTrain(r,c) = p(1,1);
        end
        if dataTrain(r,c) > p(1,2)
            dataTrain(r,c) = p(1,2);
        end
        wineAdj(r,c) = dataTrain(r,c);
    end
    
    for r=1:widthValid
        if dataValid(r,c) < p(1,1)
            dataValid(r,c) = p(1,1);
        end
        if dataValid(r,c) > p(1,2)
            dataValid(r,c) = p(1,2);
        end
        validAdj(r,c) = dataValid(r,c);
    end
end

for r=1:widthTrain
%     wineAdj(r,12) = wine.Quality(r);
      wineAdj(r,12) = classTrain(r,1);
end

tblWine = array2table(wineAdj);
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


tblValid = array2table(validAdj);
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

%% boxplot
% arrwine = table2array(wine);
% arrwine = arrwine(:,1:11);
% boxplot(arrwine);
% arrwine = normalize(arrwine);
% boxplot(arrwine);









