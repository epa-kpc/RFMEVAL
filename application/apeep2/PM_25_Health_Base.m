
Cause = 1;

%% BenMAP Form
Deaths = (Mortality{3,1}.*(One'*(1-(1./(exp(0.005826891.*PM_25_B')))))').*Pop_over_30;
Mort = sum(sum(Deaths.*WTP_Mort));

%% BenMAP Form
% Currently the model will not compute infant mortality
Infant = (Mortality{3,1}.*(One'*(1-(1./(exp(0.*PM_25_B')))))').*Pop_Infant;
Mort_Infant = sum(sum(Infant.*WTP_Mort));

All_Mort{1,1} = (Mort+Mort_Infant);

Damages = [All_Mort{Cause,1}];
B_25_Primary_MD = (sum(sum(Damages)));

%% Chronic Bronchitis BenMAP Form
% Abbey, et al. (1995)
%{
Cases_CB = ((0.00378.*One'*(1-(1./(exp(0.09132.*PM_25_B')))))').*CB_Pop;
CB_PM25_B = sum(sum(Cases_CB.*WTP_Morb));
%}
