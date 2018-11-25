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

%% 80
max80(11) = 0;
for i = 1:11
    max80(i) = 1.28 * s(i) + m(i);
end
min80(11) = 0;
for i = 1:11
    min80(i) = -1.28 * s(i) + m(i);
end

%% max80
WhiteWine.FixAcid(WhiteWine.FixAcid > max80(1)) = max80(1);
WhiteWine.VolAcid(WhiteWine.VolAcid > max80(2)) = max80(2);
WhiteWine.CitAcid(WhiteWine.CitAcid > max80(3)) = max80(3);
WhiteWine.ResSugar(WhiteWine.ResSugar > max80(4)) = max80(4);
WhiteWine.Chlorides(WhiteWine.Chlorides > max80(5)) = max80(5);
WhiteWine.FreeS02(WhiteWine.FreeS02 > max80(6)) = max80(6);
WhiteWine.TotalS02(WhiteWine.TotalS02 > max80(7)) = max80(7);
WhiteWine.Density(WhiteWine.Density > max80(8)) = max80(8);
WhiteWine.pH(WhiteWine.pH > max80(9)) = max80(9);
WhiteWine.Sulphates(WhiteWine.Sulphates > max80(10)) = max80(10);
WhiteWine.Alcohol(WhiteWine.Alcohol > max80(11)) = max80(11);
 
%% min80
WhiteWine.FixAcid(WhiteWine.FixAcid < min80(1)) = min80(1);
WhiteWine.VolAcid(WhiteWine.VolAcid < min80(2)) = min80(2);
WhiteWine.CitAcid(WhiteWine.CitAcid < min80(3)) = min80(3);
WhiteWine.ResSugar(WhiteWine.ResSugar < min80(4)) = min80(4);
WhiteWine.Chlorides(WhiteWine.Chlorides < min80(5)) = min80(5);
WhiteWine.FreeS02(WhiteWine.FreeS02 < min80(6)) = min80(6);
WhiteWine.TotalS02(WhiteWine.TotalS02 < min80(7)) = min80(7);
WhiteWine.Density(WhiteWine.Density < min80(8)) = min80(8);
WhiteWine.pH(WhiteWine.pH < min80(9)) = min80(9);
WhiteWine.Sulphates(WhiteWine.Sulphates < min80(10)) = min80(10);
WhiteWine.Alcohol(WhiteWine.Alcohol < min80(11)) = min80(11);
