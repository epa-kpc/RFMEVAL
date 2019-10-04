% MORTALITY

    
 Mort_D_A = zeros(3109,5);
 Mort_D_A(:,1) = NH3_A;
 Mort_D_A(:,2) = NOx_A;
 Mort_D_A(:,3) = PM_25_A;
 Mort_D_A(:,4) = SO2_A;
 Mort_D_A(:,5) = VOC_A;
 %Mort_D_A(:,4) = PM_25_Dust;
 
 Mort_D_L = zeros(3109,5); 
 Mort_D_L(:,1) = NH3_L;
 Mort_D_L(:,2) = NOx_L;
 Mort_D_L(:,3) = PM_25_L;
 Mort_D_L(:,4) = SO2_L;
 Mort_D_L(:,5) = VOC_L;
 
 Mort_D_M = zeros(3109,5); 
 Mort_D_M(:,1) = NH3_M;
 Mort_D_M(:,2) = NOx_M;
 Mort_D_M(:,3) = PM_25_M;
 Mort_D_M(:,4) = SO2_M;
 Mort_D_M(:,5) = VOC_M;
 
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
 %Code added by M. Amend 5/16/2018
 save('AP2 BPT Estimates.mat', 'Mort_D_A','Mort_D_L','Mort_D_M','Mort_D_T','Mort_D_T2')
 xlswrite('AP2 BPT Estimates.xlsx',Mort_D_A,1,'A1')
 xlswrite('AP2 BPT Estimates.xlsx',Mort_D_L,2,'A1')
 xlswrite('AP2 BPT Estimates.xlsx',Mort_D_M,3,'A1')
 xlswrite('AP2 BPT Estimates.xlsx',Mort_D_T,4,'A1')
 xlswrite('AP2 BPT Estimates.xlsx',Mort_D_T2,5,'A1')
 
% save U:\Office_PC\APEEP_V_2011\Model\2011_MD_Mort_Results_2MVSL.mat Mort_D_A Mort_D_L Mort_D_M Mort_D_T Mort_D_T2;
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