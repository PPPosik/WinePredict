%% std 표준편차
s(11) = 0;
s(1) = std(WhiteWine.FixAcid); 
s(2) = std(WhiteWine.VolAcid); 
s(3) = std(WhiteWine.CitAcid); 
s(4) = std(WhiteWine.ResSugar); 
s(5) = std(WhiteWine.Chlorides);
s(6) = std(WhiteWine.FreeS02); 
s(7) = std(WhiteWine.TotalS02);
s(8) = std(WhiteWine.Density); 
s(9) = std(WhiteWine.pH); 
s(10) = std(WhiteWine.Sulphates); 
s(11) = std(WhiteWine.Alcohol);

%% mean 평균
m(11) = 0;
m(1) = mean(WhiteWine.FixAcid); 
m(2) = mean(WhiteWine.VolAcid); 
m(3) = mean(WhiteWine.CitAcid); 
m(4) = mean(WhiteWine.ResSugar); 
m(5) = mean(WhiteWine.Chlorides);
m(6) = mean(WhiteWine.FreeS02); 
m(7) = mean(WhiteWine.TotalS02);
m(8) = mean(WhiteWine.Density); 
m(9) = mean(WhiteWine.pH); 
m(10) = mean(WhiteWine.Sulphates); 
m(11) = mean(WhiteWine.Alcohol);

%% 90
max90(11) = 0;
for i = 1:11
    max90(i) = 1.65 * s(i) + m(i);
end
min90(11) = 0;
for i = 1:11
    min90(i) = -1.65 * s(i) + m(i);
end

%% 97
max97(11) = 0;
for i = 1:11
    max97(i) = 2.17 * s(i) + m(i);
end
min97(11) = 0;
for i = 1:11
    min97(i) = -2.17 * s(i) + m(i);
end
 
%% max97
WhiteWine.FixAcid(WhiteWine.FixAcid > max97(1)) = max97(1);
WhiteWine.VolAcid(WhiteWine.VolAcid > max97(2)) = max97(2);
WhiteWine.CitAcid(WhiteWine.CitAcid > max97(3)) = max97(3);
WhiteWine.ResSugar(WhiteWine.ResSugar > max97(4)) = max97(4);
WhiteWine.Chlorides(WhiteWine.Chlorides > max97(5)) = max97(5);
WhiteWine.FreeS02(WhiteWine.FreeS02 > max97(6)) = max97(6);
WhiteWine.TotalS02(WhiteWine.TotalS02 > max97(7)) = max97(7);
WhiteWine.Density(WhiteWine.Density > max97(8)) = max97(8);
WhiteWine.pH(WhiteWine.pH > max97(9)) = max97(9);
WhiteWine.Sulphates(WhiteWine.Sulphates > max97(10)) = max97(10);
WhiteWine.Alcohol(WhiteWine.Alcohol > max97(11)) = max97(11);
 
%% min97
WhiteWine.FixAcid(WhiteWine.FixAcid < min97(1)) = min97(1);
WhiteWine.VolAcid(WhiteWine.VolAcid < min97(2)) = min97(2);
WhiteWine.CitAcid(WhiteWine.CitAcid < min97(3)) = min97(3);
WhiteWine.ResSugar(WhiteWine.ResSugar < min97(4)) = min97(4);
WhiteWine.Chlorides(WhiteWine.Chlorides < min97(5)) = min97(5);
WhiteWine.FreeS02(WhiteWine.FreeS02 < min97(6)) = min97(6);
WhiteWine.TotalS02(WhiteWine.TotalS02 < min97(7)) = min97(7);
WhiteWine.Density(WhiteWine.Density < min97(8)) = min97(8);
WhiteWine.pH(WhiteWine.pH < min97(9)) = min97(9);
WhiteWine.Sulphates(WhiteWine.Sulphates < min97(10)) = min97(10);
WhiteWine.Alcohol(WhiteWine.Alcohol < min97(11)) = min97(11);