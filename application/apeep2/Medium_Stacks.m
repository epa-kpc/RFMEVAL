% (* ::Package:: *)

% Medium Stacks

load 'J:\SHARE\OAQPS 2014-2019\Reduced Form Tools Testing (3-40)\Models\AP2\2011_PM_Worksheet_Med_Tall_Western_Adj'

I = eye (3109,3109);

%%  NOx NO3

run Med_Reset
NOx_Med_Stack = 28761.72.*1.35.*NOx_Cal.*(Med_Stack {1,1});
p=11;
for n = 1:S; 
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Med_Stack {4,1}(:,2)'+I (n,:));
    NOx (:,3) =((Emission_Plus)*((NOx_Med_Stack)))';
   
run Ammonium_Excess     
run PM_25_Health

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
    
run Ammonium_Excess    
run PM_25_Health

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
for n = 1:S; 
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Med_Stack {4,1}(:,5)'+I (n,:));
    SO2 (:,3) = ((Emission_Plus)*(SO2_Med_Stack))';
  
run Ammonium_Excess     
run PM_25_Health

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
NH3_Med_Stack = 28761.72.*1.06.*NH4_Cal.*(Med_Stack {5,1});
p=14;
for n = 1:S; 
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Med_Stack {4,1}(:,1)'+I (n,:));
    NH3 (:,3) = ((Emission_Plus)*(NH3_Med_Stack))';    
     
run Ammonium_Excess     
run PM_25_Health

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
VOC_Med_Stack = 28761.72.*VOC_Cal.*Med_Stack {2,1};
p=15;
for n = 1:S; 
    
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Med_Stack {4,1}(:,6)'+I (n,:));
    A_VOC (:,3) = ((Emission_Plus)*(VOC_Med_Stack))';    
     
run Ammonium_Excess    
run PM_25_Health

if Model_Morbidity == 1;
	VOC_M(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    VOC_M(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end

clear VOC_Med_Stack
run Med_Reset