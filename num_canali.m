% Ritorna il numero di canali, 1 se monocromo, 3 se RGB
function [num] = num_canali(image)
   dim = size(image);
   len = length(dim);
   num = -1; % se non entra negli if
   if len == 2
       num = 1;
   elseif len == 3
        num = dim(3);
   end
end