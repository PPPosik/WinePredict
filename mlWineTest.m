function mse = mlWineTest(trainXlsFileName, testXlsFileName, testResponseXlsFileName)
%MLWINETEST Summary of this function goes here
%   Detailed explanation goes here

mse = [];
for kernelScale=0.83-0.5:0.1:0.83+0.5
    quality = mlWine(trainXlsFileName, testXlsFileName, 'gaussian', kernelScale);
    trueQuality = readtable(testResponseXlsFileName);
    mse1 = mean((quality - trueQuality).^2);
    mse = [mse mse1];
end

quality = mlWine(trainXlsFileName, testXlsFileName, 'gaussian', kernelScale);
trueQuality = readtable(testResponseXlsFileName);
mse2 = mean((quality - trueQuality).^2);

mseSet = [mse1 mse2];
[data index] = sort(mseSet);

end

