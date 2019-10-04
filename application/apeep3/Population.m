Pop_Matrix = Mortality {6,1};

Total_Pop = zeros (3109,1);
Pop_over_30 = zeros (3109,19);


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


One = ones (1,19);
One_I = ones (3109,1);
One_Mat = ones(3109,19);
