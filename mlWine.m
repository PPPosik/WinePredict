function quality = mlWine(trainXlsFileName, testXlsFileName)
%MLWINE Summary of this function goes here
%   Detailed explanation goes here

data = readtable(trainXlsFileName);

sz = size(data);
for r=1:sz(1,1)
    data.ResSugar(r) = log10(data.ResSugar(r));
end

trainedModel = FinalPCA(data);

testData = readtable(testXlsFileName);
sz = size(testData);
for r=1:sz(1,1)
    testData.ResSugar(r) = log10(testData.ResSugar(r));
end
quality = trainedModel.predictFcn(testData);

end

