function Color_Image = Colorize_Image(Resized_Image, Complemented_Image, Colorspace_Definition)


DEFAULT_COLOR = [1 1 1];
% We should first define the default color by using the "DEFAULT_COLOR" 
% function in case the user didn't choose a specific color, and here
% choosed the (1,1,1) value which represents the white color.

if nargin < 3 % Nargin here a function that returns the number of input argument of the function.
    Colorspace_Definition = DEFAULT_COLOR;
end

Complemented_Image = (Complemented_Image ~= 0);
% And now we forced by changing the "Complemented_Image" to be a Logical
% Image.

Resized_Uint8 = im2uint8(Resized_Image);
% Here we used the "im2uint8" function again also to change the 
% "Resized_Image" into unsigned integer.

Color_Uint8 = im2uint8(Colorspace_Definition);
% And we used the same function again here on the "Colorspace_Difinition"
% Image. 

if ndims(Resized_Uint8) == 2
% Here "ndims" is a function that returns the dimension of an input array.

% If it's a Gray-Scale Image we should intialize 3 output channels
% with same values, the same values as the "Resized_Uint8".

    Red_Channel   = Resized_Uint8;
    Green_Channel = Resized_Uint8;
    Blue_Channel  = Resized_Uint8;
    
else
  % If it isn't a Gray-Scale Image we should define the channels in the
  % followinf shown way.
  
    Red_Channel   = Resized_Uint8(:,:,1);
    Green_Channel = Resized_Uint8(:,:,2);
    Blue_Channel  = Resized_Uint8(:,:,3);
    
end

% Last but not least, we will apply the colors on the "Complemted Image".

Red_Channel(Complemented_Image)   = Color_Uint8(1);
Green_Channel(Complemented_Image) = Color_Uint8(2);
Blue_Channel(Complemented_Image)  = Color_Uint8(3);

Color_Image = cat(3, Red_Channel, Green_Channel, Blue_Channel);
% Finally, we concatinate the red, green, and the blue channels into
% a 3 Dimesional array.

end

    
    