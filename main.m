

Test_Image = imread('Test Images/2_right.jpeg'); 
% Reading the image from the Test images file "image 2_right" exactly, 
% and then we stored it in the variable called "Test_Image".

figure, imshow(Test_Image)
title('Original Image')

Resized_Image = imresize(Test_Image, [584 565]);
% Since the image is large, we should resize it to make the computation faster.

figure, imshow(Resized_Image)
title('Resized Image')

Converted_Image = im2double(Resized_Image);
% The pixel values of this variable only accept integers so we need 
% to cast it to accept decimal points by double datatype.

Lab_Image = rgb2lab(Converted_Image);
% This image in RGB color space and we need to change it to CIE-Lab color space.

fill = cat(3, 1,0,0); 
% We use "cat" function here to concatenate the parameters in the 3D of the concatenated arrays.

Filled_Image = bsxfun(@times, fill, Lab_Image);
% We used "bsxfun" function to perform element wise binary operation between the variables.

Reshaped_Lab_Image = reshape(Filled_Image, [], 3);
% We will keep this dimesion argument empty since we don't want any particular
% dimesion, and we used 3 here because its the existed dimension for
% "Filled_Image".

[C, S] = pca(Reshaped_Lab_Image);
% Now we want to apply principal component analysis "PCA" function, under
% the following argument and it will return the cooficient and the score of principal component.

S = reshape(S, size(Lab_Image));
% We should reshape also "S" based on the size of "Lab_Image".

S = S(:, :, 1);
% And here we want all rows an all colums of the first channel, the 1 here
% represents that we are talking about channel "1", and then store it in S.

Gray_Image = (S-min(S(:)))./(max(S(:))-min(S(:)));
% Converting S to a Grayscale image; so, we subtract the minimum value of S
% by S, then we devide them by the difference between the Max and Min of S.
% And the point here in "./" represent th element wise devision.

Enhanced_Image = adapthisteq(Gray_Image, 'numTiles', [8 8], 'nBins', 128);
% Now we want to perform contrast enhancement of the Gray image and we can do 
% that by using Adaptive Histogram Equalization function in MATLAB which is "adapthisteq"
% and we will apply the enhancement block by block so we should write in
% the arguments "numTiles", which is abbreviation  for Number of Tiles, and
% then we will add the size fo the block in the third argument.
% In the fourth argument we used "nBins" function which represents the
% Number of Bins.

% The next task now is to apply the filter "Average Filter".

Avg_Filter = fspecial('average', [9 9]);
% By using "fspecial" function we are defining the filter, under the
% format of "fspecial('name', [size]);".

Filtered_Image = imfilter(Enhanced_Image, Avg_Filter);
% Here we applied the filter to the image by using "imfilter" function
% with the image and filter name as two arguments for this function.

figure, imshow(Filtered_Image)
title('Filtered Image')
% Using "imshow" function to show the image under a suitable title.

Substracted_Image = imsubtract(Filtered_Image,Enhanced_Image);
% We will subtract the Enhanced image from the Filtered image by using
% "imsubtract" function, and we calculate the difference.

level = Threshold_Level(Substracted_Image);
% To segment the blood vessels we should calculate the Threshold Level.
% So, we will Create a function called "Threshold_Level". 

Binary_Image = im2bw(Substracted_Image, level-0.008);
% we used here "im2bw" function to convert the Subtracted Image to a Binary
% Image, and instead of using the Threshold level directly as a second
% argument in this function we can reduce the amount a little bit to get a 
% more accurate result more than local Thresholding.

figure, imshow(Binary_Image)
title('Binary Image')

% But we can see that there still noise in the image and this is not an
% acceptable result, So we should use the following function to remove the
% noise.

Clean_Image = bwareaopen(Binary_Image, 100);
% we will use the "bw-area-open" function to remove this noise from the
% image, and here we will remove all noise from the binary image which are
% smaller than 100 pixels.

figure, imshow(Clean_Image)
title('Clean Image')

% Now we get the clean image for the segmented vessels but as a binary
% image, and now we will return it back to a colored image by using
% both of the following functions.

Complemented_Image = imcomplement(Clean_Image);
% We used the "im-complement" function here which will return the
% complement of the argued Binary Image in this function, then we can
% colorize it by the following function.

figure, imshow(Complemented_Image)
title('Complemented Image')

Final_Result = Colorize_Image(Resized_Image, Complemented_Image, [0 0 0]);
% We used here the "Colorize_Image" function to return the Binary Image to
% a colored image, and then we will get our final Segmented Image.

figure, imshow(Final_Result)
title('Final Result')




