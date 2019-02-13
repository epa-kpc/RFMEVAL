PM_25_B(:,1) = (NO3(:,1)+SO4(:,1)+A_VOC(:,1)+A_VOC(:,2)+A_VOC(:,3)+A_VOC(:,4) + A_VOC(:,5) + B_VOC(:,1)+PM_25_Primary(:,1) +  PM_25_Primary(:,2) + PM_25_Primary(:,3) + PM_25_Primary(:,4)+ PM_25_Primary(:,5)+NH4);

%%AQ Data Export; code added by M. Amend 4/30/2018
%Set directory where AQ files will be saved
dir = '/work/ROMO/users/kpc/rfmeval/ap3/output/tier3/';
csvwrite([dir 'TotalPM25_Concentrations.csv'], PM_25_B);

spPM = zeros(3109,8);
spPM(:,2)=NO3(:,1);
spPM(:,3)=SO4(:,1);
spPM(:,4)=sum(PM_25_Primary,2);
spPM(:,5)=sum(A_VOC,2);
spPM(:,6)=B_VOC(:,1);
spPM(:,7)=NH4(:,1);
spPM(:,8)=PM_25_B;
spPM(:,1)=Code(:,1);

csvwrite([dir 'Speciated_PM25.csv'],spPM);
clear dir spPM
