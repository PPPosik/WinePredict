function mse = mlWineTest(trainXlsFileName, testXlsFileName, testResponseXlsFileName)
%MLWINETEST Summary of this function goes here
%   Detailed explanation goes here

% mse = mlWineTest('trainingData.xlsx','validationPredictors.xlsx','validationResponse.xlsx');
% mse = mlWineTest('train.xlsx','testData.xlsx','testRes.xlsx');

% mseSet = [];
% for minLeafSize=8-6:1:8+6
%     for numLearningCycles=30-20:2:30+20
%         quality = mlWine(trainXlsFileName, testXlsFileName, minLeafSize, numLearningCycles);
%         trueQuality = readtable(testResponseXlsFileName);
%         trueQuality = table2array(trueQuality);
%         mseTmp = mean((quality - trueQuality).^2);
%         mseSet = [mseSet mseTmp];
%     end
% end
% BasisFunction = ["none", "constant", "linear", "pureQuadratic"];
% KernelFunction = ["exponential", "squaredexponential", "matern32", "matern52", "rationalquadratic", "ardexponential", "ardsquaredexponential", "ardmatern32", "ardmatern52", "ardrationalquadratic"];

% for scale=6.1:0.1:6.2
    quality = mlWine(trainXlsFileName, testXlsFileName);
    trueQuality = readtable(testResponseXlsFileName);
    trueQuality = table2array(trueQuality);
    mse = mean((quality - trueQuality).^2);
% end


% for basisIdx=1:4
%     for kernelIdx=1:10
%         quality = mlWine(trainXlsFileName, testXlsFileName, BasisFunction(basisIdx), KernelFunction(kernelIdx));
%         trueQuality = readtable(testResponseXlsFileName);
%         trueQuality = table2array(trueQuality);
%         mseTmp = mean((quality - trueQuality).^2);
%         mseSet = [mseSet mseTmp];
%     end
% end

%         quality = mlWine(trainXlsFileName, testXlsFileName, 'pureQuadratic', 'squaredexponential');
%         trueQuality = readtable(testResponseXlsFileName);
%         trueQuality = table2array(trueQuality);
%         mseTmp = mean((quality - trueQuality).^2);
%         mseSet = [mseSet mseTmp];
% Sigma = 0.6110955929201233
% 'KernelParameters', [5.864206438383397 1 0.6110955929201233]
% for KernelParameters1=5.864206438383397-2:2:5.864206438383397+2
%     for KernelParameters2=0.6110955929201233-0.2:0.2:0.6110955929201233+0.2
%         quality = mlWine(trainXlsFileName, testXlsFileName, 'constant', 'rationalquadratic', KernelParameters1, KernelParameters2);
%         trueQuality = readtable(testResponseXlsFileName);
%         trueQuality = table2array(trueQuality);
%         mseTmp = mean((quality - trueQuality).^2);
%         mseSet = [mseSet mseTmp];
%     end
% end

% randomPartition
% 'constant', 'rationalquadratic'

% mseSet = [];
% for KFold = 5:5:10
%     for Fraction = 95:-5:50
%         quality = mlWine(trainXlsFileName, testXlsFileName, KFold, Fraction);
%         trueQuality = readtable(testResponseXlsFileName);
%         trueQuality = table2array(trueQuality);
%         mseTmp = mean((quality - trueQuality).^2);
%         mseSet = [mseSet mseTmp];
%     end
% end

% [data index] = sort(mseSet);
% mse = mseSet(index(1));

% 0.1373 // BasisFunction = 'constant', KernelFunction = 'ardrationalquadratic'
% 0.3358 // minLeafSize = 2, numLearningCycles = 30
% plot(mseSet)

end

