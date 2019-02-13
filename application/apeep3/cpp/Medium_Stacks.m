% (* ::Package:: *)

% Medium Stacks
load '/work/ROMO/users/kpc/rfmeval/ap3/code.cpp/2014_PM_Worksheet_Med_Tall_Western_Adj'
I = eye (3109,3109);
MD_Mat = cell(5,1); 
NOx_M = zeros(3109,3109);
NH3_M = zeros(3109,3109);
PM_25_M = zeros(3109,3109);
VOC_M = zeros(3109,3109);
SO2_M = zeros(3109,3109);

%%  NOx NO3

run Med_Reset
NOx_Med_Stack = 28761.72.*1.35.*NOx_Cal.*(Med_Stack {1,1});
p=11;
for n = 1:S; 
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Med_Stack {4,1}(:,2)'+I (n,:));
    NOx (:,3) =((Emission_Plus)*((NOx_Med_Stack)))';
   
% run Ammonium_Excess    
run Nitrate_Sulfate_Ammonium_Marginal_New
run PM_25_Health
% run PM_25_Health_Matrix
% NOx_M(n,:) = (Damage_Mort+Damage_Morb)';
    
if Model_Morbidity == 1;
	NOx_M(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    NOx_M(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end
clear NOx_Med_Stack
%% Primary PM 25

run Med_Reset
PM_Med_Stack = 28761.72.*PM25_Cal.*(Med_Stack {2,1});
p=12;
for n = 1:S; 
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Med_Stack {4,1}(:,4)'+I (n,:));
    PM_25_Primary (:,3) =((Emission_Plus)*(PM_Med_Stack))';
    
% run Ammonium_Excess    
run Nitrate_Sulfate_Ammonium    
run PM_25_Health
% run PM_25_Health_Matrix
% PM_25_M(n,:) = (Damage_Mort+Damage_Morb)';

if Model_Morbidity == 1;
	PM_25_M(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    PM_25_M(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end
clear PM_Med_Stack
%% SO2_SO4

run Med_Reset
SO2_Med_Stack = 28761.72.*1.5.*SO2_Cal.*(Med_Stack {3,1});
p=13;
for n = 1:3109; 
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Med_Stack {4,1}(:,5)'+I (n,:));
    SO2 (:,3) = ((Emission_Plus)*(SO2_Med_Stack))';
  
% run Ammonium_Excess    
run Nitrate_Sulfate_Ammonium     
run PM_25_Health
% run PM_25_Health_Matrix
% SO2_M(n,:) = (Damage_Mort+Damage_Morb)';

if Model_Morbidity == 1;
	SO2_M(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    SO2_M(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end
clear SO2_Med_Stack
%% NH3 NH4

run Med_Reset
NH3_Med_Stack = 28761.72.*1.06.* (NH4_Cal.*(Med_Stack {5,1}));
p=14;
for n = 1:3109; 
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Med_Stack {4,1}(:,1)'+I (n,:));
    NH3 (:,3) = ((Emission_Plus)*(NH3_Med_Stack))';    
     
% run Ammonium_Excess    
run Nitrate_Sulfate_Ammonium     
run PM_25_Health
% run PM_25_Health_Matrix
% NH3_M(n,:) = (Damage_Mort+Damage_Morb)';

if Model_Morbidity == 1;
	NH3_M(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    NH3_M(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end
clear NH3_Med_Stack
%% VOC

run Med_Reset
VOC_Med_Stack = Med_Stack {2,1};
p=15;
for n = 1:3109; 
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Med_Stack {4,1}(:,6)'+I (n,:));
    A_VOC (:,3) = (28761.72.*(VOC_Cal.*Emission_Plus)*(VOC_Med_Stack))';    
     
% run Ammonium_Excess    
run Nitrate_Sulfate_Ammonium    
run PM_25_Health
% run PM_25_Health_Matrix
% VOC_M(n,:) = (Damage_Mort+Damage_Morb)';

if Model_Morbidity == 1;
	VOC_M(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    VOC_M(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end
