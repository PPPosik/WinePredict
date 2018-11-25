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

%% 70
max70(11) = 0;
for i = 1:11
    max70(i) = 1.04 * s(i) + m(i);
end
min70(11) = 0;
for i = 1:11
    min70(i) = -1.04 * s(i) + m(i);
end
 
%% max70
WhiteWine.FixAcid(WhiteWine.FixAcid > max70(1)) = max70(1);
WhiteWine.VolAcid(WhiteWine.VolAcid > max70(2)) = max70(2);
WhiteWine.CitAcid(WhiteWine.CitAcid > max70(3)) = max70(3);
WhiteWine.ResSugar(WhiteWine.ResSugar > max70(4)) = max70(4);
WhiteWine.Chlorides(WhiteWine.Chlorides > max70(5)) = max70(5);
WhiteWine.FreeS02(WhiteWine.FreeS02 > max70(6)) = max70(6);
WhiteWine.TotalS02(WhiteWine.TotalS02 > max70(7)) = max70(7);
WhiteWine.Density(WhiteWine.Density > max70(8)) = max70(8);
WhiteWine.pH(WhiteWine.pH > max70(9)) = max70(9);
WhiteWine.Sulphates(WhiteWine.Sulphates > max70(10)) = max70(10);
WhiteWine.Alcohol(WhiteWine.Alcohol > max70(11)) = max70(11);
 
%% min70
WhiteWine.FixAcid(WhiteWine.FixAcid < min70(1)) = min70(1);
WhiteWine.VolAcid(WhiteWine.VolAcid < min70(2)) = min70(2);
WhiteWine.CitAcid(WhiteWine.CitAcid < min70(3)) = min70(3);
WhiteWine.ResSugar(WhiteWine.ResSugar < min70(4)) = min70(4);
WhiteWine.Chlorides(WhiteWine.Chlorides < min70(5)) = min70(5);
WhiteWine.FreeS02(WhiteWine.FreeS02 < min70(6)) = min70(6);
WhiteWine.TotalS02(WhiteWine.TotalS02 < min70(7)) = min70(7);
WhiteWine.Density(WhiteWine.Density < min70(8)) = min70(8);
WhiteWine.pH(WhiteWine.pH < min70(9)) = min70(9);
WhiteWine.Sulphates(WhiteWine.Sulphates < min70(10)) = min70(10);
WhiteWine.Alcohol(WhiteWine.Alcohol < min70(11)) = min70(11);
