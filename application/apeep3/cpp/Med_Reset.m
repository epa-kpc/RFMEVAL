NH3(:,3) =           1.06.*(28761.72.*(Med_Stack{4,1}(:,1)')*(NH4_Cal.*(Med_Stack{5,1})))';
NOx(:,3) =           1.35.*(28761.72.*(Med_Stack{4,1}(:,2)')*(NOx_Cal.*(Med_Stack{1,1})))';
PM_25_Primary(:,3) =       (28761.72.*(Med_Stack{4,1}(:,4)')*(PM25_Cal.*(Med_Stack{2,1})))';
A_VOC(:,3) =               (28761.72.*(VOC_Cal.*Med_Stack{4,1}(:,6)')*(Med_Stack{2,1}))';
SO2(:,3) =           1.50.*(28761.72.*(Med_Stack{4,1}(:,5)')*(SO2_Cal.*(Med_Stack{3,1})))';
