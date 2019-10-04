% Determine Excess Ammonium (NH4)

NH4(:,1) = (NH3(:,1) + NH3(:,2) + NH3(:,3) + NH3(:,4) + NH3(:,5));
SO4(:,1) = (SO2(:,1) + SO2(:,2) + SO2(:,3) + SO2(:,4) + SO2(:,5));
NH4e(:,1) = NH4(:,1) - 0.375.*SO4(:,1);
NO3(:,1) = (NOx(:,1) + NOx(:,2) + NOx(:,3) + NOx(:,4) + NOx(:,5));

for c = 1:3109;
    if NH4e(c,1) > (0.29.*NO3(c,1));
        NO3(c,1) = NO3(c,1);
    else NO3(c,1) = NO3(c,1);     
    end
    if NH4e(c,1) > 0 & NH4e(c,1) < (0.29.*NO3(c,1));
        NO3(c,1) = (NH4e(c,1)./0.29);
    else NO3(c,1) = NO3(c,1);      
    end   
    if NH4e(c,1) <= 0;
        NO3(c,1) = 0;
        NH4e(c,1) = 0;
    else NO3(c,1) = NO3(c,1);      
    end  
end

NO3(:,1) = (Nitrate_Temp(:,1)).*1.290.*(NO3(:,1));
SO4(:,1) = 1.375.*(SO2(:,1) + SO2(:,2)+ SO2(:,3)+ SO2(:,4) + SO2(:,5));
NH4e(:,1) = NH4e(:,1) - (NO3(:,1));

for c = 1:3109;
    if NH4e(c,1) <= 0;        
        NH4e(c,1) = 0;
    else NH4e(c,1) = NH4e(c,1);      
    end   
end


PM_25(:,1) = (NO3(:,1)+SO4(:,1)+A_VOC(:,1)+A_VOC(:,2)+A_VOC(:,3)+A_VOC(:,4) + A_VOC(:,5) + B_VOC(:,1)+PM_25_Primary(:,1) +  PM_25_Primary(:,2) + PM_25_Primary(:,3) + PM_25_Primary(:,4)+ PM_25_Primary(:,5));
%PM_10(:,1) = (NO3(:,1)+SO4(:,1)+A_VOC(:,1)+A_VOC(:,2)+A_VOC(:,3)+A_VOC(:,4) + A_VOC(:,5) + B_VOC(:,1)+PM_10_Primary(:,1) +  PM_10_Primary(:,2) + PM_10_Primary(:,3) + PM_10_Primary(:,4)+ PM_10_Primary(:,5));



