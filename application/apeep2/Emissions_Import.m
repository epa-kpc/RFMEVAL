% This script allows the user to update the area, low, medium, tall, and new tall emissions
% Created by M. Amend 5/16/2018

%Set directory where emissions .csv files are stored
clear
dir = 'J:\SHARE\OAQPS 2014-2019\Reduced Form Tools Testing (3-40)\Models\AP2\4. Emissions Files\EC Only\';

%%Area and Low Stack Sources
%Load AP3 .mat file for area and low stack sources
load 'J:\SHARE\OAQPS 2014-2019\Reduced Form Tools Testing (3-40)\Models\AP2\2011_PM_Worksheet_Area_Low_Western_Adj'

%*****Update emissions file names here*****
Area_Emissions = csvread([dir 'AP2_emissions_2030rg_ctl_v5_07e_Area.PEC.fixed.csv'],0,1);
Low_Emissions = csvread([dir 'AP2_emissions_2030rg_ctl_v5_07e_LowStack.PEC.fixed.csv'],0,1);

%Error Checking
check = [3109 7];

if isequal(size(Area_Emissions), check)==0;
	disp('Area emissions inputs are not the right dimensions')
elseif isequal(size(Low_Emissions), check)==0;
	disp('Low stack emissions inputs are not the right dimensions')
end

%Load Emissions into source-specific matrices
Area_Source{4,1} = Area_Emissions;
Low_Stack{4,1} = Low_Emissions;

%Save updated .mat file
clear dir check
save 'J:\SHARE\OAQPS 2014-2019\Reduced Form Tools Testing (3-40)\Models\AP2\2011_PM_Worksheet_Area_Low_Western_Adj'
clear

%%Med and Tall Stack Sources
%Re-set directory where emissions .csv files are stored
dir = 'J:\SHARE\OAQPS 2014-2019\Reduced Form Tools Testing (3-40)\Models\AP2\4. Emissions Files\EC Only\';

%Load AP3 .mat file for medium and tall stack sources
load 'J:\SHARE\OAQPS 2014-2019\Reduced Form Tools Testing (3-40)\Models\AP2\2011_PM_Worksheet_Med_Tall_Western_Adj'

%*****Update emissions file names here*****
Med_Emissions = csvread([dir 'AP2_emissions_2030rg_ctl_v5_07e_MedStackplusTS.PEC.fixed.csv'],0,1);
Tall_Emissions = csvread([dir 'AP2_emissions_2030rg_ctl_v5_07e_TallStack.PEC.fixed.csv'],0,1);
NewTall_Emissions = csvread([dir 'AP2_emissions_2030rg_ctl_v5_07e_NewTallStack.PEC.fixed.csv'],0,1);

%Error Checking
check1 = [3109 7];
check2 = [565 7];
check3 = [91 7];

if isequal(size(Med_Emissions), check1)==0;
	disp('Medium stack emissions inputs are not the right dimensions')
elseif isequal(size(Tall_Emissions), check2)==0;
	disp('Tall stack emissions inputs are not the right dimensions')
elseif isequal(size(NewTall_Emissions), check3)==0;
	disp('New tall stack emissions inputs are not the right dimensions')
end

%Load Emissions into source-specific matrices
Med_Stack{4,1} = Med_Emissions;
Tall_Stack{4,1} = Tall_Emissions;
New_Tall{4,1} = NewTall_Emissions;

%Save updated .mat file
clear dir check1 check2 check3
save 'J:\SHARE\OAQPS 2014-2019\Reduced Form Tools Testing (3-40)\Models\AP2\2011_PM_Worksheet_Med_Tall_Western_Adj'
clear