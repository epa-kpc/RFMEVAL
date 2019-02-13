NH3(:,2) =           1.06.*(28761.72.*(Low_Stack{4,1}(:,1)')*(NH4_Cal.*(Low_Stack{5,1})))';
NOx(:,2) =           1.35.*(28761.72.*(Low_Stack{4,1}(:,2)')*(NOx_Cal.*(Low_Stack{1,1})))';
PM_10_Primary(:,2) =       (28761.72.*(Low_Stack{4,1}(:,3)')*(0.33.*(Low_Stack{2,1})))';
PM_25_Primary(:,2) =       (28761.72.*(Low_Stack{4,1}(:,4)')*(PM25_Cal.*(Low_Stack{2,1})))';
SO2(:,2) =           1.50.*(28761.72.*(Low_Stack{4,1}(:,5)')*(SO2_Cal.*(Low_Stack{3,1})))';
A_VOC(:,2) =               (28761.72.*(Low_Stack{4,1}(:,6)')*(VOC_Cal.*Low_Stack{2,1}))';
