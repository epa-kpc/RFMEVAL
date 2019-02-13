
% Pope, 2002 = 0.005826891 (BENMAP, same as Krewski, 2009; 30-99 adult all-cause mortality)
% Laden, 2006 = 0.014842001 (BENMAP)
% Woodruff et al., 2006 = .006765865 (BenMAP; 0-0 infant all-cause mortality)

Cause = 1;

%% BenMAP Form
Deaths = (Mortality{3,1}.*(One'*(1-(1./(exp(0.005826891.*PM_25_B')))))').*Pop_over_30;
Mort = sum(sum(Deaths.*WTP_Mort));

%% BenMAP Form
% Currently the model will not compute infant mortality
Infant = (Mortality{3,1}.*(One'*(1-(1./(exp(0.*PM_25_B')))))').*Pop_Infant;
Mort_Infant = sum(sum(Infant.*WTP_Mort));

All_Mort{1,1} = (Mort+Mort_Infant);
%Spatial_Mort_B = Mort_Adult_Spatial+Mort_Infant_Spatial;

Damages = [All_Mort{Cause,1}];
B_25_Primary_MD = (sum(sum(Damages)));

