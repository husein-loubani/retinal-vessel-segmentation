

function level = Threshold_Level(Image)
% Before begining with any function we should use the keyword "function"
% for defining it, and then a variable name which will be returned "level",
% with the name of the function which it is "Threshold_Level", and it will
% take "Image" as an input.

Image = im2uint8(Image(:));
% We used "im2uint8" function to change the type to unsigned integer.

[Histogram_Count,Bin_Number]=imhist(Image);
% Here we used the "imhist" function which will return the histogram count
% and the Bin number.

i = 1;

Cumulative_Sum = cumsum(Histogram_Count);
% Calculating the Cumulative Sum of the Histogram Count using "cumsum"
% function.

T(i) = (sum(Bin_Number.*Histogram_Count))/Cumulative_Sum(end);
% Inialise T Variable indexed at 1 which is equal to the sum at i on Bin
% Number multiplied by the Histogram Count all devided by the Cumulative
% Sum indexed at the end.

T(i)=round(T(i));
% We used "round" function here for rounding of T(i).


% And we want to find the Mean(Average) above and Below (T).

Cumulative_Sum_2 = cumsum(Histogram_Count(1:T(i)));
MBT=sum(Bin_Number(1:T(i)).*Histogram_Count(1:T(i)))/Cumulative_Sum_2(end);
% First, we should find the Cumulative Sum of the Histogram Count from 1 to
% T(i) and save the results in "Cumulative_Sum_2", so we can calculate the
% "MBT" which is the "Mean Below T".

Cumulative_Sum_3=cumsum(Histogram_Count(T(i):end));
MAT=sum(Bin_Number(T(i):end).*Histogram_Count(T(i):end))/Cumulative_Sum_3(end);
% Second, we should find the Cumulative Sum of the Histogram Count from T(i) to
% end and save the results in "Cumulative_Sum_3", so we can calculate the
% "MAT" which is the "Mean Above T".


i = i+1;

T(i) = round((MAT+MBT)/2);

while abs(T(i)-T(i-1))>=1
    
Cumulative_Sum_2 = cumsum(Histogram_Count(1:T(i)));
MBT=sum(Bin_Number(1:T(i)).*Histogram_Count(1:T(i)))/Cumulative_Sum_2(end);

Cumulative_Sum_3=cumsum(Histogram_Count(T(i):end));
MAT=sum(Bin_Number(T(i):end).*Histogram_Count(T(i):end))/Cumulative_Sum_3(end);

i = i+1;
T(i) = round((MAT+MBT)/2);

Threshold = T(i);
    
end

level = (Threshold - 1) / (Bin_Number(end) - 1);
% we use this equation to normalize the Threshold.
end


