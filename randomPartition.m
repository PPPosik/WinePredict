function mse = randomPartition()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% mse = randomPartition();
mseSet = [];
for i=1:3
    wine = readtable('White_Wine.xlsx');

    response = wine.Quality;
    measurement = wine{:, 1:11};

    c = cvpartition(response, 'HoldOut', 0.2);

    dataTrain = measurement(c.training, :);
    dataValid = measurement(c.test, :);
    classTrain = response(c.training);
    classValid = response(c.test);

    train = [dataTrain classTrain];
    tblTrain = array2table(train);
    tblTrain.Properties.VariableNames{1} = 'FixAcid';
    tblTrain.Properties.VariableNames{2} = 'VolAcid';
    tblTrain.Properties.VariableNames{3} = 'CitAcid';
    tblTrain.Properties.VariableNames{4} = 'ResSugar';
    tblTrain.Properties.VariableNames{5} = 'Chlorides';
    tblTrain.Properties.VariableNames{6} = 'FreeS02';
    tblTrain.Properties.VariableNames{7} = 'TotalS02';
    tblTrain.Properties.VariableNames{8} = 'Density';
    tblTrain.Properties.VariableNames{9} = 'pH';
    tblTrain.Properties.VariableNames{10} = 'Sulphates';
    tblTrain.Properties.VariableNames{11} = 'Alcohol';
    tblTrain.Properties.VariableNames{12} = 'Quality';

    tblTest = array2table(dataValid);
    tblTest.Properties.VariableNames{1} = 'FixAcid';
    tblTest.Properties.VariableNames{2} = 'VolAcid';
    tblTest.Properties.VariableNames{3} = 'CitAcid';
    tblTest.Properties.VariableNames{4} = 'ResSugar';
    tblTest.Properties.VariableNames{5} = 'Chlorides';
    tblTest.Properties.VariableNames{6} = 'FreeS02';
    tblTest.Properties.VariableNames{7} = 'TotalS02';
    tblTest.Properties.VariableNames{8} = 'Density';
    tblTest.Properties.VariableNames{9} = 'pH';
    tblTest.Properties.VariableNames{10} = 'Sulphates';
    tblTest.Properties.VariableNames{11} = 'Alcohol';

    tblRes = array2table(classValid);
    tblRes.Properties.VariableNames{1} = 'Quality';

    writetable(tblTrain, 'train.xlsx');
    writetable(tblTest, 'testData.xlsx');
    writetable(tblRes, 'testRes.xlsx');

    mseTmp = mlWineTest('train.xlsx','testData.xlsx','testRes.xlsx');
    mseSet = [mseSet mseTmp];
end

xlswrite('mseSet.xlsx', mseSet);

[data index] = sort(mseSet);
mse = mseSet(index(1));

end

