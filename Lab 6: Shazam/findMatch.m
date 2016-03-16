function match = findMatch(query_features,songs, print_len, thresh)
% Finds a song in 'songs' that has a sequence of features that is within a
% bit error rate of 'thresh' from the query features, and returns 
% the name of the match.
% 
% Inputs:
% queryFeatures - a 100x1 vector of 16-bit decimal numbers that represent
%       the features of the noisy query clip
% songs - a struct array of all the songs in the database
% thresh - bit error rate
%
% Outputs:
% match - name of the closest match in the database to the query prints

match = '';
