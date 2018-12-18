%%
train = readtable('train.xlsx');
validData = readtable('testData.xlsx');
validRes = readtable('testRes.xlsx');

%%
szTrain = size(train);
szValid = size(validData);

for r=1:szTrain(1,1)
    train.ResSugar(r) = log10(train.ResSugar(r));
end

for r=1:szValid(1,1)
    validData.ResSugar(r) = log10(validData.ResSugar(r));
end

%%
