function quality = mlWine(trainXlsFileName, testXlsFileName, kenelFunction, kernelScale)
%MLWINE Summary of this function goes here
%   Detailed explanation goes here

% kenelFunction = 'linear';

trainData = readtable(trainXlsFileName);
trainedModel = FcnTest(trainData, kenelFunction, kernelScale);

testData = readtable(testXlsFileName);
quality = trainedModel.predictFcn(testData);

end

