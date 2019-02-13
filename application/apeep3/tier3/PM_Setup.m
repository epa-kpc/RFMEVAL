% (* ::Package:: *)

clear
     load '/work/ROMO/users/kpc/rfmeval/ap3/code.tier3/2014_PM_Worksheet_Area_Low_Western_Adj'
     %load 'G:\Share\OAQPS 2014-2019\Reduced Form Tools Testing (3-40)\Models\AP3\PM_Incidence.mat'
%%

SO2 = zeros (3109,5);
NOx = zeros (3109,5);
NO3 = zeros (3109,1);
PM_10_Primary = zeros (3109,5);
PM_25_Primary = zeros (3109,5);
NH3 = zeros (3109,5);
NH4 = zeros (3109,1);
NH4e = zeros (3109,1);
SO4 = zeros (3109,1);
A_VOC = zeros (3109,5);
B_VOC = zeros (3109,1);
PM_10_A = zeros (3109,1);
PM_10_L = zeros (3109,1);
PM_10_M = zeros (3109,1);
PM_10_T = zeros (565,1);
PM_10_T2 = zeros (91,1);
PM_25_A = zeros (3109,1);
PM_25_Dust = zeros(3109,1);
PM_25_L = zeros (3109,1);
PM_25_M = zeros (3109,1);
PM_25_T = zeros (565,1);
PM_25_T2 = zeros (91,1);
NOx_A = zeros (3109,1);
NOx_L = zeros (3109,1);
NOx_M = zeros (3109,1);
NOx_T = zeros (565,1);
NOx_T2 = zeros (91,1);
SO2_A = zeros (3109,1);
SO2_L = zeros (3109,1);
SO2_M = zeros (3109,1);
SO2_T = zeros (565,1);
SO2_T2 = zeros (91,1);
% NH3_A _I = zeros (3109,1);
% NH3_L _I = zeros (3109,1);
% NH3_M _I = zeros (3109,1);
% NH3_T _I = zeros (565,1);
% NOx_A _I = zeros (3109,1);
% NOx_L _I = zeros (3109,1);
% NOx_M _I = zeros (3109,1);
% NOx_T _I = zeros (565,1);
% SO2_A _I = zeros (3109,1);
% SO2_L _I = zeros (3109,1);
% SO2_M _I = zeros (3109,1);
% SO2_T _I = zeros (565,1);
NH3_A = zeros (3109,1);
NH3_L = zeros (3109,1);
NH3_M = zeros (3109,1);
NH3_T = zeros (565,1);
NH3_T2 = zeros (91,1);
VOC_A = zeros (3109,1);
VOC_L = zeros (3109,1);
VOC_M = zeros (3109,1);
VOC_T = zeros (565,1);
VOC_T2 = zeros (91,1);
Delta = zeros (3109,1);
PM_25_B = zeros (3109,1);
PM_10_B = zeros (3109,1);
Vis_A = zeros (3109,5);
Vis_L = zeros (3109,5);
Vis_M = zeros (3109,5);
Vis_T = zeros (565,5);
Vis_T2 = zeros (91,5);
Beta_IR = zeros (17,1);
Beta_OR = zeros (17,1);
Beta_IR (14:17,1) = [80 80 168.6 129.2]';
Beta_OR (14:17,1) = [49 49 135 89.8]';
VR = zeros (17,1);
VR_Zero = zeros (17,1);
Rec_IR = zeros (3109,17);
Rec_OR = zeros (3109,17);

All_Mort = cell(4,1);


%% PM Species Calibration for AP3
PM25_Cal = 0.67;
SO2_Cal = 1.25;
NOx_Cal = 0.58; 
NH4_Cal = 0.31;
VOC_Cal = 0.03;
VOC_B_Fixed = 0.010;

%% WILLINGNESS TO PAY

%Mortality
% EPA: $ 8,705,114.25 ($2015), income adjusted to scenario year

%WTP_Mort = 10397684; %2025 value for CPP P;
WTP_Mort = 10437345; %2030 value for Tier 3

%% Morbidity Valuation
Model_Morbidity = 0;

%COI_NFHA = 210000;
%COI_HA_R = 37000;
%COI_HA_C = 44000;
%COI_ER_A = 440;
%COI_WLD  = 150;
%COI_SLD  = 98;
%WTP_URS  = 37;
%WTP_LRS  = 23;
%WTP_A    = 59;
%WTP_ARS  = 67;


%% Number of Sources

S = 3109;
T = 565;
T2 = 91;
%%
