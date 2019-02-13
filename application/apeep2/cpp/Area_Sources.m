% (* ::Package:: *)

% Area Sources
load '/work/ROMO/users/kpc/rfmeval/ap2/code.cpp/2011_PM_Worksheet_Area_Low_Western_Adj'

I = eye (3109,3109);
%% NOx NO3

run Area_Reset
NOx_Area_Source = 28761.72.*1.35.*NOx_Cal.*(Area_Source {1,1});
p = 1;
for n = 1:S;
    
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Area_Source {4,1}(:,2)'+I (n,:));
    NOx (:,1) = ((Emission_Plus)*(NOx_Area_Source))';

run Ammonium_Excess
run PM_25_Health

if Model_Morbidity == 1;
	NOx_A(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    NOx_A(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end
 clear NOx_Area_Source
%% Primary PM 25

run Area_Reset
p = 2;
PM_Area_Source = 28761.72.*PM25_Cal.*(Area_Source {2,1});
for n = 1:S;   
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Area_Source {4,1}(:,4)'+I (n,:));
    PM_25_Primary (:,1) = ((Emission_Plus)*(PM_Area_Source))';                         
     
run Ammonium_Excess    
run PM_25_Health

if Model_Morbidity == 1;
	PM_25_A(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    PM_25_A(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end
clear Damages
toc
end
clear PM_Area_Source
 
%% SO2 SO4

run Area_Reset
p = 4;
SO2_Area_Source = 28761.72.*1.5.*SO2_Cal.*(Area_Source {3,1});
for n = 1:S;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Area_Source {4,1}(:,5)'+I (n,:));
    SO2 (:,1) = ((Emission_Plus)*(SO2_Area_Source))';
    
    run Ammonium_Excess
    run PM_25_Health

if Model_Morbidity == 1;
	SO2_A(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    SO2_A(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end

clear Damages
toc
end
clear SO2_Area_Source
%% NH3 NH4

run Area_Reset
p = 5;
NH3_Area_Source = 28761.72.*1.06.*NH4_Cal.*(Area_Source {5,1});
for n = 1:S;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Area_Source {4,1}(:,1)'+I (n,:));
    NH3 (:,1) = ((Emission_Plus)*(NH3_Area_Source))';    
     
run Ammonium_Excess
run PM_25_Health

if Model_Morbidity == 1;
	NH3_A(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    NH3_A(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end
clear Damages
toc
end
clear NH3_Area_Source
%% VOC

run Area_Reset
VOC_Area_Source = 28761.72.*VOC_Cal.*(Area_Source {2,1});
p = 6;
for n = 1:S;
    tic
    display(sprintf('p %d,n %d,m %d', n,p));
    Emission_Plus = (Area_Source {4,1}(:,6)'+I (n,:));
    A_VOC (:,1) = ((Emission_Plus)*(VOC_Area_Source))';    
     
run Ammonium_Excess
run PM_25_Health

if Model_Morbidity == 1;
	VOC_A(n,1) = sum(sum(CB_PM25 - CB_PM25_B));
else
    Damages = [All_Mort{Cause,1}];
    VOC_A(n,1) = ((sum(sum(Damages)))) - B_25_Primary_MD;
end
clear Damages
toc
end

