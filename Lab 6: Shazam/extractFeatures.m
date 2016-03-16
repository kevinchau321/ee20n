function features = extractFeatures(filename,window_time,fs_target,print_len);
% This function extracts features from the audio file filename
%
% Inputs:
% filename - name of the file to sample from
% window_time - duration of the STFT window (in seconds)
% fs_target - desired sampling rate (we'll use 4kHz)
% print_len - bits in each feature
%
% Outputs:
% features - 256x1 vector of 16-bit decimal numbers, representing the
%           features of this audio file

features = 0; % Delete this! You'll have to define what 'features' is

%spectrogram parameters
window = ceil(window_time*fs_target);
NFFT = window;
noverlap = floor(1/2*window);

%read the file

[audio fs] = wavread(filename);
audio = audio(:,1);

%resample to the target sampling rate
audio_ds = resample(audio,fs_target,fs);

%find the spectrogram of the audio
[S F T P] = spectrogram(audio_ds,window,noverlap,NFFT,fs);
S= abs(S);
%display the spectrogram if desired
imagesc(T,F,10*log10(P)); axis tight;
axis('xy'); colormap(jet);
xlabel('Time (sec)'); ylabel('Freq (kHz)');

%% extract features from the spectrogram data
energy_per_band = zeros(print_len+1,size(S,2));

% find how many spectrogram rows belong in each frequency band
rows_per_band = size(S,1)/17; % <---change this 0 to the correct value!

% for each of the print_len+1=17 frequency bands, sum up the magnitude of all the elements
% in that frequency band
for j = 1:print_len+1
    energy_per_band(j,:) = sum(S, 2); % replace this 0 with the appropriate code
end

% find the features in binary form by comparing each row of energy_per_band
% to the row beneath it

% convert the features to decimal representation
