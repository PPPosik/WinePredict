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
         
%% max90
WhiteWine.FixAcid(WhiteWine.FixAcid > max90(1)) = max90(1);
WhiteWine.VolAcid(WhiteWine.VolAcid > max90(2)) = max90(2);
WhiteWine.CitAcid(WhiteWine.CitAcid > max90(3)) = max90(3);
WhiteWine.ResSugar(WhiteWine.ResSugar > max90(4)) = max90(4);
WhiteWine.Chlorides(WhiteWine.Chlorides > max90(5)) = max90(5);
WhiteWine.FreeS02(WhiteWine.FreeS02 > max90(6)) = max90(6);
WhiteWine.TotalS02(WhiteWine.TotalS02 > max90(7)) = max90(7);
WhiteWine.Density(WhiteWine.Density > max90(8)) = max90(8);
WhiteWine.pH(WhiteWine.pH > max90(9)) = max90(9);
WhiteWine.Sulphates(WhiteWine.Sulphates > max90(10)) = max90(10);
WhiteWine.Alcohol(WhiteWine.Alcohol > max90(11)) = max90(11);

%% min90
WhiteWine.FixAcid(WhiteWine.FixAcid < min90(1)) = min90(1);
WhiteWine.VolAcid(WhiteWine.VolAcid < min90(2)) = min90(2);
WhiteWine.CitAcid(WhiteWine.CitAcid < min90(3)) = min90(3);
WhiteWine.ResSugar(WhiteWine.ResSugar < min90(4)) = min90(4);
WhiteWine.Chlorides(WhiteWine.Chlorides < min90(5)) = min90(5);
WhiteWine.FreeS02(WhiteWine.FreeS02 < min90(6)) = min90(6);
WhiteWine.TotalS02(WhiteWine.TotalS02 < min90(7)) = min90(7);
WhiteWine.Density(WhiteWine.Density < min90(8)) = min90(8);
WhiteWine.pH(WhiteWine.pH < min90(9)) = min90(9);
WhiteWine.Sulphates(WhiteWine.Sulphates < min90(10)) = min90(10);
WhiteWine.Alcohol(WhiteWine.Alcohol < min90(11)) = min90(11);