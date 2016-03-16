function rate = ber(a,b,print_len)
% Returns the BER between two identically-sized vectors containing numbers
% that are at most print_len bits long.
%
% Inputs:
% a - first vector
% b - second vector
% print_len - maximum number of bits in each entry of a or b
%
% Outputs:
% rate - bit error rate between a and b. To find this, you want to first 
%    convert a and b to bit representations. Then count
%    the number of indices where a and b differ, and divide this by the total
%    number of bits in a, i.e. this should be print_len*length(a).


rate = 100; % you will have to change this!