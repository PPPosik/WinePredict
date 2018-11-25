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

%% 95
max95(11) = 0;
for i = 1:11
    max95(i) = 1.96 * s(i) + m(i);
end
min95(11) = 0;
for i = 1:11
    min95(i) = -1.28 * s(i) + m(i);
end

%% max95
WhiteWine.FixAcid(WhiteWine.FixAcid > max95(1)) = max95(1);
WhiteWine.VolAcid(WhiteWine.VolAcid > max95(2)) = max95(2);
WhiteWine.CitAcid(WhiteWine.CitAcid > max95(3)) = max95(3);
WhiteWine.ResSugar(WhiteWine.ResSugar > max95(4)) = max95(4);
WhiteWine.Chlorides(WhiteWine.Chlorides > max95(5)) = max95(5);
WhiteWine.FreeS02(WhiteWine.FreeS02 > max95(6)) = max95(6);
WhiteWine.TotalS02(WhiteWine.TotalS02 > max95(7)) = max95(7);
WhiteWine.Density(WhiteWine.Density > max95(8)) = max95(8);
WhiteWine.pH(WhiteWine.pH > max95(9)) = max95(9);
WhiteWine.Sulphates(WhiteWine.Sulphates > max95(10)) = max95(10);
WhiteWine.Alcohol(WhiteWine.Alcohol > max95(11)) = max95(11);
 
%% min95
WhiteWine.FixAcid(WhiteWine.FixAcid < min95(1)) = min95(1);
WhiteWine.VolAcid(WhiteWine.VolAcid < min95(2)) = min95(2);
WhiteWine.CitAcid(WhiteWine.CitAcid < min95(3)) = min95(3);
WhiteWine.ResSugar(WhiteWine.ResSugar < min95(4)) = min95(4);
WhiteWine.Chlorides(WhiteWine.Chlorides < min95(5)) = min95(5);
WhiteWine.FreeS02(WhiteWine.FreeS02 < min95(6)) = min95(6);
WhiteWine.TotalS02(WhiteWine.TotalS02 < min95(7)) = min95(7);
WhiteWine.Density(WhiteWine.Density < min95(8)) = min95(8);
WhiteWine.pH(WhiteWine.pH < min95(9)) = min95(9);
WhiteWine.Sulphates(WhiteWine.Sulphates < min95(10)) = min95(10);
WhiteWine.Alcohol(WhiteWine.Alcohol < min95(11)) = min95(11);
