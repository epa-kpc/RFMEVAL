Pop_Matrix = Mortality {6,1};

Total_Pop = zeros (3109,1);
Pop_over_30 = zeros (3109,19);
%CB_Pop = zeros (3109,19);
%Senior_Pop = zeros (3109,1);
%Pop_over_25 = zeros (3109,19);
%Pop_8_12 = zeros (3109,1);

for r = 1:3109;
    Total_Pop (r,1) = sum (Pop_Matrix (r,:));
end

for r = 1:3109;
    Pop_over_30(r,:) = (Pop_Matrix (r,:));
end
for r = 1:7;
    Pop_over_30(:,r) = zeros (3109,1);
end

for r = 1:3109;
    Pop_Infant (r,:) = (Pop_Matrix (r,:));
end
for r = 2:19;
    Pop_Infant (:,r) = zeros (3109,1);
end


% Chronic CB Prevalence Rate is 5%
%{
for r = 1:3109
    CB_Pop (r,:) =  (Pop_Matrix (r,:)) - (0.00378.*(Pop_Matrix (r,:)));
end
for r = 1:7;
    CB_Pop (:,r) = zeros (3109,1);
end
for r = 1:3109;
    Senior_Pop (r,1) = sum (Pop_Matrix (r,15:19));
end

for r = 1:3109;
    Pop_8_12(r,1) = sum ((Pop_Matrix (r,2:3)));
end
%}
 

One = ones (1,19);
One_I = ones (3109,1);
