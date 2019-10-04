
% Pope, 2002 = 0.005826891 (BENMAP, same as Krewski, 2009; 30-99 adult all-cause mortality)
% Laden, 2006 = 0.014842001 (BENMAP)
% Woodruff et al., 2006 = .006765865 (BenMAP; 0-0 infant all-cause mortality)


%% BenMAP Form
Deaths = (Mortality{3,1}.*(One'*(1-(1./(exp(0.005826891.*PM_25')))))').*Pop_over_30;
%Mort_Adult_Spatial = Deaths.*WTP_Mort;
Mort = sum(sum(Deaths.*WTP_Mort));

%% BenMAP Form
% Currently the model will not compute infant mortality
Infant = (Mortality{3,1}.*(One'*(1-(1./(exp(0.*PM_25')))))').*Pop_Infant;
Mort_Infant = sum(sum(Infant.*WTP_Mort));
All_Mort{1,1} = (Mort+Mort_Infant);
