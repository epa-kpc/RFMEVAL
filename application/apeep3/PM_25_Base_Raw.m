PM_25_B(:,1) = (NO3(:,1)+SO4(:,1)+A_VOC(:,1)+A_VOC(:,2)+A_VOC(:,3)+A_VOC(:,4) + A_VOC(:,5) + B_VOC(:,1)+PM_25_Primary(:,1) +  PM_25_Primary(:,2) + PM_25_Primary(:,3) + PM_25_Primary(:,4)+ PM_25_Primary(:,5)+NH4);

%%AQ Data Export; code added by M. Amend 4/30/2018
%Set directory where AQ files will be saved
dir = 'J:\SHARE\OAQPS 2014-2019\Reduced Form Tools Testing (3-40)\Models\AP3\';
xlswrite([dir 'Total PM2.5 Concentrations.xlsx'], PM_25_B, 1, 'A1');

spPM = zeros(3109,6);
spPM(:,1)=NO3(:,1);
spPM(:,2)=SO4(:,1);
spPM(:,3)=sum(PM_25_Primary,2);
spPM(:,4)=sum(A_VOC,2);
spPM(:,5)=B_VOC(:,1);
spPM(:,6)=NH4(:,1);

xlswrite([dir 'Speciated PM2.5.xlsx'],spPM,1,'A1');
clear dir spPM