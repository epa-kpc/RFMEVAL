% MORTALITY

    
 Mort_D_A = zeros(3109,5);
 Mort_D_A(:,1) = NH3_A;
 Mort_D_A(:,2) = NOx_A;
 Mort_D_A(:,3) = PM_25_A;
 Mort_D_A(:,4) = SO2_A;
 Mort_D_A(:,5) = VOC_A;
 
 
 Mort_D_L = zeros(3109,5); 
 Mort_D_L(:,1) = NH3_L;
 Mort_D_L(:,2) = NOx_L;
 Mort_D_L(:,3) = PM_25_L;
 Mort_D_L(:,4) = SO2_L;
 Mort_D_L(:,5) = VOC_L;
 
 Mort_D_M = zeros(3109,5); 
 Mort_D_M(:,1) = NH3_M(:,1);
 Mort_D_M(:,2) = NOx_M(:,1);
 Mort_D_M(:,3) = PM_25_M(:,1);
 Mort_D_M(:,4) = SO2_M(:,1);
 Mort_D_M(:,5) = VOC_M(:,1);
 
 Mort_D_T = zeros(565,5); 
 Mort_D_T(:,1) = NH3_T;
 Mort_D_T(:,2) = NOx_T;
 Mort_D_T(:,3) = PM_25_T;
 Mort_D_T(:,4) = SO2_T;
 Mort_D_T(:,5) = VOC_T;
 
 Mort_D_T2 = zeros(91,5); 
 Mort_D_T2(:,1) = NH3_T2;
 Mort_D_T2(:,2) = NOx_T2;
 Mort_D_T2(:,3) = PM_25_T2;
 Mort_D_T2(:,4) = SO2_T2;
 Mort_D_T2(:,5) = VOC_T2;

 %Save BPT Estimates as .mat and .xslx files
 %Code added by M. Amend 5/14/2018
 save('AP3 BPT Estimates.mat', 'Mort_D_A','Mort_D_L','Mort_D_M','Mort_D_T','Mort_D_T2');
 csvwrite('AP3_BPT_Estimates_area.csv',Mort_D_A);
 csvwrite('AP3_BPT_Estimates_lowp.csv',Mort_D_L);
 csvwrite('AP3_BPT_Estimates_medium.csv',Mort_D_M);
 csvwrite('AP3_BPT_Estimates_tall.csv',Mort_D_T);
 csvwrite('AP3_BPT_Estimates_newtall.csv',Mort_D_T2);
 
%save G:\Share\OAQPS 2014-2019\Reduced Form Tools Testing (3-40)\Models\AP3\Tier3_Mort_Results_2.23.2018.mat Mort_D_A Mort_D_L Mort_D_M Mort_D_T Mort_D_T2;
%  MORBIDITY
% %  
%  Morb_D_A = zeros(3109,5);
%  Morb_D_A(:,1) = NH3_A;
%  Morb_D_A(:,2) = PM_25_A;
%  Morb_D_A(:,3) = NOx_A;
%  Morb_D_A(:,4) = SO2_A;
%  Morb_D_A(:,5) = VOC_A;
%  
%  Morb_D_L = zeros(3109,5); 
%  Morb_D_L(:,1) = NH3_L;
%  Morb_D_L(:,2) = PM_25_L;
%  Morb_D_L(:,3) = NOx_L;
%  Morb_D_L(:,4) = SO2_L;
%  Morb_D_L(:,5) = VOC_L;
%  
%  Morb_D_M = zeros(3109,5); 
%  Morb_D_M(:,1) = NH3_M;
%  Morb_D_M(:,2) = PM_25_M;
%  Morb_D_M(:,3) = NOx_M;
%  Morb_D_M(:,4) = SO2_M;
%  Morb_D_M(:,5) = VOC_M;
%  
%  Morb_D_T = zeros(565,5); 
%  Morb_D_T(:,1) = NH3_T;
%  Morb_D_T(:,2) = PM_25_T;
%  Morb_D_T(:,3) = NOx_T;
%  Morb_D_T(:,4) = SO2_T;
%  Morb_D_T(:,5) = VOC_T;
%  
%  Morb_D_T2 = zeros(91,5); 
%  Morb_D_T2(:,1) = NH3_T2;
%  Morb_D_T2(:,2) = PM_25_T2;
%  Morb_D_T2(:,3) = NOx_T2;
%  Morb_D_T2(:,4) = SO2_T2;
%  Morb_D_T2(:,5) = VOC_T2; 

%  PWE_D_A = zeros(3109,5);
%  PWE_D_A(:,1) = NH3_A;
%  PWE_D_A(:,2) = PM_25_A;
%  PWE_D_A(:,3) = NOx_A;
%  PWE_D_A(:,4) = SO2_A;
%  PWE_D_A(:,5) = VOC_A;
%  
%  PWE_D_L = zeros(3109,5); 
%  PWE_D_L(:,1) = NH3_L;
%  PWE_D_L(:,2) = PM_25_L;
%  PWE_D_L(:,3) = NOx_L;
%  PWE_D_L(:,4) = SO2_L;
%  PWE_D_L(:,5) = VOC_L;
%  
%  PWE_D_M = zeros(3109,5); 
%  PWE_D_M(:,1) = NH3_M;
%  PWE_D_M(:,2) = PM_25_M;
%  PWE_D_M(:,3) = NOx_M;
%  PWE_D_M(:,4) = SO2_M;
%  PWE_D_M(:,5) = VOC_M;
%  
%  PWE_D_T = zeros(565,5); 
%  PWE_D_T(:,1) = NH3_T;
%  PWE_D_T(:,2) = PM_25_T;
%  PWE_D_T(:,3) = NOx_T;
%  PWE_D_T(:,4) = SO2_T;
%  PWE_D_T(:,5) = VOC_T;
%  
%  PWE_D_T2 = zeros(91,5); 
%  PWE_D_T2(:,1) = NH3_T2;
%  PWE_D_T2(:,2) = PM_25_T2;
%  PWE_D_T2(:,3) = NOx_T2;
%  PWE_D_T2(:,4) = SO2_T2;
%  PWE_D_T2(:,5) = VOC_T2;

% save E:\APEEP_V_2002\NAS_Data\2030_PM_Morb_Adj.mat Morb_D_A Morb_D_L Morb_D_M Morb_D_T Morb_D_T2 
