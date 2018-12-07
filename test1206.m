%% load
d = readtable('trainingData.xlsx');
dV = readtable('validationPredictors.xlsx');
cV = readtable('validationResponse.xlsx');

data = d;
dataValid = dV;
classValid = cV;

%% sugar log10
arrData = table2array(data);
for c=1:11
    range = prctile(arrData(:,c), [1 99]);
    for r=1:3919
        if arrData(r,c) < range(1,1)
            arrData(r,c) = -7777;
        end
        if arrData(r,c) > range(1,2)
            arrData(r,c) = -7777;
        end
    end
end

for r=3919:-1:1
    if min(arrData(r,:)) == -7777
        arrData(r,:) = [];
    end
end

data = array2table(arrData);
data.Properties.VariableNames{1} = 'FixAcid';
data.Properties.VariableNames{2} = 'VolAcid';
data.Properties.VariableNames{3} = 'CitAcid';
data.Properties.VariableNames{4} = 'ResSugar';
data.Properties.VariableNames{5} = 'Chlorides';
data.Properties.VariableNames{6} = 'FreeS02';
data.Properties.VariableNames{7} = 'TotalS02';
data.Properties.VariableNames{8} = 'Density';
data.Properties.VariableNames{9} = 'pH';
data.Properties.VariableNames{10} = 'Sulphates';
data.Properties.VariableNames{11} = 'Alcohol';
data.Properties.VariableNames{12} = 'Quality';

% data.FixAcid = normalize(data.FixAcid, 'range');
% data.VolAcid = normalize(data.VolAcid, 'range');
% data.CitAcid = normalize(data.VolAcid, 'range');
% data.Acid = (data.FixAcid + data.VolAcid + data.CitAcid) / 3;
sz = size(data);
for r=1:sz(1,1)
    data.ResSugar(r) = log10(d.ResSugar(r));
end
for r=1:979
    dataValid.ResSugar(r) = log10(dV.ResSugar(r));
end
% dataValid.FixAcid = normalize(dataValid.FixAcid, 'range');
% dataValid.VolAcid = normalize(dataValid.VolAcid, 'range');
% dataValid.CitAcid = normalize(dataValid.VolAcid, 'range');
% dataValid.Acid = (dataValid.FixAcid + dataValid.VolAcid + dataValid.CitAcid) / 3;

%%
[quality index] = sort(WhiteWine.Quality);

arr = zeros(4898, 12);
for r=1:4898
    for c=1:11
        arr(r,c) = table2array(WhiteWine(index(r), c));
    end
    arr(r,12) = quality(r);
end
















