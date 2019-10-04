
%% Compute concentrations of particulate nitrate, ammonium, and sulfate.
% 18 = MW particulate NH4
% 96 = MW particulate Sulfate
% 0.12028 = (1/8.314)PPM to Mole
% 339.9329 = (101300/298) PPM to Mole
% 0.01595 = 1/MW PNO3 = 62
% 0.00039 = (273K+10C)*(Gaseous Nitric Acid in ug/m^3)/(1,000*(12.187*62))
%   This yields gaseous nitric acid in ppm then coverted to moles as above.

% load 'C:\Users\NZM\Box Sync\APEEP_V_2014\Model\County_Temp_2011.mat'

%% Predictions from AP3

NH4(:,1) = (NH3(:,1) + NH3(:,2) + NH3(:,3) + NH3(:,4) + NH3(:,5));
SO4(:,1) = (SO2(:,1) + SO2(:,2) + SO2(:,3) + SO2(:,4) + SO2(:,5));
NH4e(:,1) = (NH4(:,1)./18 - 1.5.*SO4(:,1)./96);
% HNO3(:,1) = 339.9329.*(0.12028.*(0.00039.*(NOx(:,1) + NOx(:,2) + NOx(:,3) + NOx(:,4) + NOx(:,5))));
% HNO3(:,1) = 339.9329.*(0.12028.*((((County_Temp(:,1)+County_Temp(:,2))./2+273)./(1000.*12.187.*62)).*(NOx(:,1) + NOx(:,2) + NOx(:,3) + NOx(:,4) + NOx(:,5))));
HNO3(:,1) = (NOx(:,1) + NOx(:,2) + NOx(:,3) + NOx(:,4) + NOx(:,5))./62;

HNO3_Base = HNO3;

for c = 1:3109;
    if NH4e(c,1) <= 0;        
        NH4e(c,1) = 0.00000000000000000001;
    else NH4e(c,1) = NH4e(c,1);      
    end  
end

% Specifications from Charles: Fit 1
NO3(:,1) = 0.6509.*(0.33873.*HNO3+0.121008.*NH4e+ 3.511482.*(HNO3.*NH4e)).*62;

% NO3(:,1) = 0.385.*(exp(0.008267.*LN_HNO3(:,1)) +  (0.178005.*NH4e(:,1))./0.01595);
SO4(:,1) = (1.375.*(SO2(:,1) + SO2(:,2)+ SO2(:,3)+ SO2(:,4) + SO2(:,5)));

% Assemble species into total PM_25
PM_25(:,1) = (NO3(:,1)+SO4(:,1)+A_VOC(:,1)+A_VOC(:,2)+A_VOC(:,3)+A_VOC(:,4) + A_VOC(:,5) + B_VOC(:,1)+PM_25_Primary(:,1) +  PM_25_Primary(:,2) + PM_25_Primary(:,3) + PM_25_Primary(:,4)+ PM_25_Primary(:,5)+NH4);
PM_10(:,1) = (NO3(:,1)+SO4(:,1)+A_VOC(:,1)+A_VOC(:,2)+A_VOC(:,3)+A_VOC(:,4) + A_VOC(:,5) + B_VOC(:,1)+PM_10_Primary(:,1) +  PM_10_Primary(:,2) + PM_10_Primary(:,3) + PM_10_Primary(:,4)+ PM_10_Primary(:,5));



