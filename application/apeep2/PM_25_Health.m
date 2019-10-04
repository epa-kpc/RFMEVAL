

%% BenMAP Form
Deaths = (Mortality{3,1}.*(One'*(1-(1./(exp(0.005826891.*PM_25')))))').*Pop_over_30;
Mort = sum(sum(Deaths.*WTP_Mort));


%% BenMAP Form
Infant = (Mortality{3,1}.*(One'*(1-(1./(exp(0.*PM_25')))))').*Pop_Infant;
Mort_Infant = sum(sum(Infant.*WTP_Mort));

All_Mort{1,1} = (Mort+Mort_Infant);

%% Chronic Bronchitis BenMAP Form
% Abbey, et al. (1995)
%{
 Cases_CB = ((0.00378.*One'*(1-(1./(exp(0.09132.*PM_25')))))').*CB_Pop;
 CB_PM25 = sum(sum(Cases_CB.*WTP_Morb));
%}
