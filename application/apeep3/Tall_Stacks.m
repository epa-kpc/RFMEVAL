% (* ::Package:: *)

% Tall Stacks
I = eye (565,565);
MD_Mat_T = cell(5,1);
MD_Mat_T2 = cell(5,1);
%% NOx 
run Med_Reset
run Tall_Reset

NOx_Tall_Stack = 28761.72.*1.35.*NOx_Cal.*(Tall_Stack {1,1});
p=16;
for n = 1:T;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Tall_Stack {4,1}(:,2)'+I (n,:));
%     Emission_Plus = (0.50.*Tall_Stack {4,1}(:,2)'+I (n,:));
    NOx (:,4) = ((Emission_Plus)*(NOx_Tall_Stack))';
   
% run Ammonium_Excess    
run Nitrate_Sulfate_Ammonium_Marginal_New
run PM_25_Health

%MD_Mat_T{1,1}(n,:) = sum(((Spatial_Mort_Add+Spatial_Morb)-(Spatial_Mort_B+Spatial_Morb_B))');

if Model_Morbidity == 1;
	NOx_T(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    NOx_T(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end

%% Primary PM 25

run Tall_Reset
% run Tall_Reset_Stress_Test
PM_Tall_Stack=28761.72.*PM25_Cal.*Tall_Stack {2,1};
p=17;
for n = 1:T;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Tall_Stack {4,1}(:,4)'+I (n,:));
%     Emission_Plus = (0.50.*Tall_Stack {4,1}(:,4)'+I (n,:));
    PM_25_Primary (:,4) =((Emission_Plus)*((PM_Tall_Stack)))';
    
% run Ammonium_Excess    
run Nitrate_Sulfate_Ammonium    
run PM_25_Health

%MD_Mat_T{2,1}(n,:) = sum(((Spatial_Mort_Add+Spatial_Morb)-(Spatial_Mort_B+Spatial_Morb_B))');

if Model_Morbidity == 1;
	PM_25_T(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    PM_25_T(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end

%% SO2_SO4

run Tall_Reset
% run Tall_Reset_Stress_Test
SO2_Tall_Stack = 28761.72.*1.5.*SO2_Cal.*Tall_Stack {3,1};
p=18;
for n = 1:T;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Tall_Stack {4,1}(:,5)'+I (n,:));
%     Emission_Plus = (0.50.*Tall_Stack {4,1}(:,5)'+I (n,:));
    SO2 (:,4) = ((Emission_Plus)*((SO2_Tall_Stack)))';
  
% run Ammonium_Excess    
run Nitrate_Sulfate_Ammonium     
run PM_25_Health

%MD_Mat_T{3,1}(n,:) = sum(((Spatial_Mort_Add+Spatial_Morb)-(Spatial_Mort_B+Spatial_Morb_B))');

if Model_Morbidity == 1;
	SO2_T(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    SO2_T(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end

%% NH3 NH4

run Tall_Reset
% run Tall_Reset_Stress_Test
NH3_Tall_Stack = 28761.72.*1.06.*NH4_Cal.*Tall_Stack {5,1};
p=19;
for n = 1:T;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Tall_Stack {4,1}(:,1)'+I (n,:));
%     Emission_Plus = (0.50.*Tall_Stack {4,1}(:,1)'+I (n,:));
    NH3 (:,4) = ((Emission_Plus)*((NH3_Tall_Stack)))';    
     
% run Ammonium_Excess    
run Nitrate_Sulfate_Ammonium      
run PM_25_Health

%MD_Mat_T{4,1}(n,:) = sum(((Spatial_Mort_Add+Spatial_Morb)-(Spatial_Mort_B+Spatial_Morb_B))');

if Model_Morbidity == 1;
	NH3_T(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    NH3_T(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end

%% VOC

run Tall_Reset
% run Tall_Reset_Stress_Test
VOC_Tall_Stack =28761.72.*Tall_Stack {2,1};
p=20;
for n = 1:T;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Tall_Stack {4,1}(:,6)'+I (n,:));
%     Emission_Plus = (0.50.*Tall_Stack {4,1}(:,6)'+I (n,:));
    A_VOC (:,4) = ((VOC_Cal.*Emission_Plus)*(VOC_Tall_Stack))';    
     
% run Ammonium_Excess    
run Nitrate_Sulfate_Ammonium      
run PM_25_Health

%MD_Mat_T{5,1}(n,:) = sum(((Spatial_Mort_Add+Spatial_Morb)-(Spatial_Mort_B+Spatial_Morb_B))');

if Model_Morbidity == 1;
	VOC_T(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    VOC_T(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end

%% New Tall Stacks

I = eye (91,91);

%% NOx 

run Tall_Reset
% run Tall_Reset_Stress_Test
NOx_New_Tall = 28761.72.*1.35.*NOx_Cal.*New_Tall {1,1};
p=21;
for n = 1:T2;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (New_Tall {4,1}(:,2)'+I (n,:));
%     Emission_Plus = (0.50.*New_Tall {4,1}(:,2)'+I (n,:));
    NOx (:,5) = ((Emission_Plus)*((NOx_New_Tall)))';
   
% run Ammonium_Excess    
run Nitrate_Sulfate_Ammonium_Marginal_New
run PM_25_Health

%MD_Mat_T2{1,1}(n,:) = sum(((Spatial_Mort_Add+Spatial_Morb)-(Spatial_Mort_B+Spatial_Morb_B))');

if Model_Morbidity == 1;
	NOx_T2(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    NOx_T2(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end

%% Primary PM 25

run Tall_Reset
% run Tall_Reset_Stress_Test
PM_New_Tall = 28761.72.*PM25_Cal.*New_Tall {2,1};
p=22;
for n = 1:T2;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (New_Tall {4,1}(:,4)'+I (n,:));
%     Emission_Plus = (0.50.*New_Tall {4,1}(:,4)'+I (n,:));
    PM_25_Primary (:,5) =((Emission_Plus)*((PM_New_Tall)))';
    
% run Ammonium_Excess    
run Nitrate_Sulfate_Ammonium     
run PM_25_Health

%MD_Mat_T2{2,1}(n,:) = sum(((Spatial_Mort_Add+Spatial_Morb)-(Spatial_Mort_B+Spatial_Morb_B))');

if Model_Morbidity == 1;
	PM_25_T2(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    PM_25_T2(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end

%% SO2_SO4

run Tall_Reset
% run Tall_Reset_Stress_Test
SO2_New_Tall = 28761.72.*1.5.*SO2_Cal.*New_Tall {3,1};
p=23;
for n = 1:T2;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (New_Tall {4,1}(:,5)'+I (n,:));
%     Emission_Plus = (0.50.*New_Tall {4,1}(:,5)'+I (n,:));
    SO2 (:,5) = ((Emission_Plus)*((SO2_New_Tall)))';
  
% run Ammonium_Excess    
run Nitrate_Sulfate_Ammonium     
run PM_25_Health

%MD_Mat_T2{3,1}(n,:) = sum(((Spatial_Mort_Add+Spatial_Morb)-(Spatial_Mort_B+Spatial_Morb_B))');

if Model_Morbidity == 1;
	SO2_T2(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    SO2_T2(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end

%% NH3 NH4

run Tall_Reset
% run Tall_Reset_Stress_Test
NH3_New_Tall = 28761.72.*1.06.*NH4_Cal.*New_Tall {5,1};
p=24;
for n = 1:T2;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (New_Tall {4,1}(:,1)'+I (n,:));
%     Emission_Plus = (0.50.*New_Tall {4,1}(:,1)'+I (n,:));
    NH3 (:,5) = ((Emission_Plus)*((NH3_New_Tall)))';    
     
% run Ammonium_Excess    
run Nitrate_Sulfate_Ammonium      
run PM_25_Health

%MD_Mat_T2{4,1}(n,:) = sum(((Spatial_Mort_Add+Spatial_Morb)-(Spatial_Mort_B+Spatial_Morb_B))');

if Model_Morbidity == 1;
	NH3_T2(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    NH3_T2(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end

%% VOC

run Tall_Reset
% run Tall_Reset_Stress_Test
VOC_New_Tall = 28761.72.*New_Tall {2,1};
p=25;
for n = 1:T2;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (New_Tall {4,1}(:,6)'+I (n,:));
%     Emission_Plus = (0.50.*New_Tall {4,1}(:,6)'+I (n,:));
    A_VOC (:,5) = ((VOC_Cal.*Emission_Plus)*(VOC_New_Tall))';    
     
% run Ammonium_Excess    
run Nitrate_Sulfate_Ammonium      
run PM_25_Health

%MD_Mat_T2{5,1}(n,:) = sum(((Spatial_Mort_Add+Spatial_Morb)-(Spatial_Mort_B+Spatial_Morb_B))');

if Model_Morbidity == 1;
	VOC_T2(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    VOC_T2(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end
