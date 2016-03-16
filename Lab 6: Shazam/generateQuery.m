function [features clean noisy SR] = generateQuery(filename,SNR,window_time,fs_target,print_len)

% This function selects a random, noisy sample from the audio file filename
%
% Inputs:
% filename - name of the file to sample from
% SNR - amount of noise to add (signal-to-noise ratio)
% window_time - duration of the STFT window (in seconds)
% fs_target - desired sampling rate (we'll use 4kHz)
% print_len - bits in each feature
%
% Outputs:
% features - 100x1 vector of 16-bit decimal numbers, representing the noisy query
% clean  - the clean audio for the song
% noisy - the noisy audio for the song
% SR - the original sampling rate for the input song


features = 0;   % delete this! you'll have to define this ouput
clean = 0;      % delete this! "
noisy = 0;      % delete this! "
SR = 0;         % delete this! "

%spectrogram parameters
window = ceil(window_time*fs_target);
NFFT = window;
noverlap = floor(1/2*window);

%read the file


% add gaussian noise

%resample to the target sampling rate

%find the spectrogram of the audio

%% extract features from the spectrogram data

% we need print_len+1 frequency bands
% find how many spectrogram rows belong in each frequency band

% find the features

% convert them to 16-bit decimal values

% extract a set of 256 consecutive features randomly from the noisy file

