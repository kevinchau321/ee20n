function songs = makeDatabase(filelist,window_time,fs_target,print_len)
% This function creates a struct array with feature information for all the
% songs in the database
%
% Inputs:
% filelist - list of all the files in the database
% window_time - duration of the STFT window (in seconds)
% fs_target - desired sampling rate (we'll use 4kHz)
% print_len - bits in each feature
%
% Outputs:
% features - 100x1 vector of 16-bit decimal numbers, representing the
%           features of this audio file


% struct array of Songs
songs = [];
