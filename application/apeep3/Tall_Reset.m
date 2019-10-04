% Tall Stacks

NH3(:,4) =           1.06.*(28761.72.*(Tall_Stack{4,1}(:,1)')*(NH4_Cal.*(Tall_Stack{5,1})))';
NOx(:,4) =           1.35.*(28761.72.*(Tall_Stack{4,1}(:,2)')*(NOx_Cal.*(Tall_Stack{1,1})))';
PM_10_Primary(:,4) =       (28761.72.*(Tall_Stack{4,1}(:,3)')*(1.*(Tall_Stack{2,1})))';
PM_25_Primary(:,4) =       (28761.72.*(Tall_Stack{4,1}(:,4)')*(PM25_Cal.*(Tall_Stack{2,1})))';
SO2(:,4) =           1.50.*(28761.72.*(Tall_Stack{4,1}(:,5)')*(SO2_Cal.*(Tall_Stack{3,1})))';
A_VOC(:,4) =               (28761.72.*(VOC_Cal.*Tall_Stack{4,1}(:,6)')*(Tall_Stack{2,1}))';

% New Tall Stacks

NH3(:,5) =           1.06.*(28761.72.*(New_Tall{4,1}(:,1)')*(NH4_Cal.*(New_Tall{5,1})))';
NOx(:,5) =           1.35.*(28761.72.*(New_Tall{4,1}(:,2)')*(NOx_Cal.*(New_Tall{1,1})))';
PM_10_Primary(:,5) =       (28761.72.*(New_Tall{4,1}(:,3)')*(1.*(New_Tall{2,1})))';
PM_25_Primary(:,5) =       (28761.72.*(New_Tall{4,1}(:,4)')*(PM25_Cal.*(New_Tall{2,1})))';
SO2(:,5) =           1.50.*(28761.72.*(New_Tall{4,1}(:,5)')*(SO2_Cal.*(New_Tall{3,1})))';
A_VOC(:,5) =               (28761.72.*(VOC_Cal.*New_Tall{4,1}(:,6)')*(New_Tall{2,1}))';