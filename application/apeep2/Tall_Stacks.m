% (* ::Package:: *)

% Tall Stacks
I = eye (565,565);

%% NOx 
run Med_Reset
run Tall_Reset

NOx_Tall_Stack = 28761.72.*1.35.*NOx_Cal.*(Tall_Stack {1,1});
p=16;
for n = 1:T;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Tall_Stack {4,1}(:,2)'+I (n,:));
    NOx (:,4) = ((Emission_Plus)*(NOx_Tall_Stack))';
   
run Ammonium_Excess      
run PM_25_Health

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
PM_Tall_Stack=28761.72.*PM25_Cal.*Tall_Stack {2,1};
p=17;
for n = 1:T;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Tall_Stack {4,1}(:,4)'+I (n,:));
    PM_25_Primary (:,4) =((Emission_Plus)*((PM_Tall_Stack)))';
    
run Ammonium_Excess    
run PM_25_Health

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
SO2_Tall_Stack = 28761.72.*1.5.*SO2_Cal.*Tall_Stack {3,1};
p=18;
for n = 1:T;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Tall_Stack {4,1}(:,5)'+I (n,:));
    SO2 (:,4) = ((Emission_Plus)*((SO2_Tall_Stack)))';
  
run Ammonium_Excess     
run PM_25_Health

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
NH3_Tall_Stack = 28761.72.*1.06.*NH4_Cal.*Tall_Stack {5,1};
p=19;
for n = 1:T;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Tall_Stack {4,1}(:,1)'+I (n,:));
    NH3 (:,4) = ((Emission_Plus)*((NH3_Tall_Stack)))';    
     
run Ammonium_Excess      
run PM_25_Health

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
VOC_Tall_Stack =28761.72.*VOC_Cal.*Tall_Stack {2,1};
p=20;
for n = 1:T;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Tall_Stack {4,1}(:,6)'+I (n,:));
    A_VOC (:,4) = ((Emission_Plus)*(VOC_Tall_Stack))';    
     
run Ammonium_Excess      
run PM_25_Health

if Model_Morbidity == 1;
	VOC_T(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    VOC_T(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end

clear VOC_Tall_Stack NOx_Tall_Stack SO2_Tall_Stack NH3_Tall_Stack PM_Tall_Stack
%% New Tall Stacks

I = eye (91,91);

%% NOx 

run Tall_Reset
NOx_New_Tall = 28761.72.*1.35.*NOx_Cal.*New_Tall {1,1};
p=21;
for n = 1:T2;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (New_Tall {4,1}(:,2)'+I (n,:));
    NOx (:,5) = ((Emission_Plus)*((NOx_New_Tall)))';
   
run Ammonium_Excess      
run PM_25_Health

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
PM_New_Tall = 28761.72.*PM25_Cal.*New_Tall {2,1};
p=22;
for n = 1:T2;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (New_Tall {4,1}(:,4)'+I (n,:));
    PM_25_Primary (:,5) =((Emission_Plus)*((PM_New_Tall)))';
    
run Ammonium_Excess    
run PM_25_Health

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
SO2_New_Tall = 28761.72.*1.5.*SO2_Cal.*New_Tall {3,1};
p=23;
for n = 1:T2;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (New_Tall {4,1}(:,5)'+I (n,:));
    SO2 (:,5) = ((Emission_Plus)*((SO2_New_Tall)))';
  
run Ammonium_Excess     
run PM_25_Health

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
NH3_New_Tall = 28761.72.*1.06.*NH4_Cal.*New_Tall {5,1};
p=24;
for n = 1:T2;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (New_Tall {4,1}(:,1)'+I (n,:));
    NH3 (:,5) = ((Emission_Plus)*((NH3_New_Tall)))';    
     
run Ammonium_Excess      
run PM_25_Health

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
VOC_New_Tall = 28761.72.*VOC_Cal.*New_Tall {2,1};
p=25;
for n = 1:T2;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (New_Tall {4,1}(:,6)'+I (n,:));
    A_VOC (:,5) = ((Emission_Plus)*(VOC_New_Tall))';    
     
run Ammonium_Excess      
run PM_25_Health

if Model_Morbidity == 1;
	VOC_T2(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    VOC_T2(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end
