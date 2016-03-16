% Main Shazam File

% constants
window_time = 0.37; % duration (s) of each window
fs_target = 4000;   % desired sampling rate - 4kHz
print_len = 16;     % bits in a subfingerprint
audio_directory = 'data';   % directory with test data
SNR = 30;
demo_music = 0;   % set this to 1 if you want to hear the music you're processing
thresh = 0.4;


%% Database Prep
disp('Generating the database .... ')
% find all the files in the data directory
filelist = getFiles(audio_directory);   

% extract features from each song and store them in a data structure of
% Songs (class with a name and a list of subfingerprints)
songs = makeDatabase(filelist,window_time,fs_target,print_len);
disp('Database constructed. ');

%% Query Generation
disp('Generating query sample ... ')

% generate a noisy query 
query_filename = ''; % change this to a random filename from the list
[query_features clean noisy SR] = generateQuery(query_filename,SNR,window_time,fs_target,print_len);


%% Query playback
if demo_music
    % Listen to the difference in sound quality
    disp('First the clean Version... ')
    playAudio(3*clean,SR,5);
    pause(1)
    disp('Then the noisy Version... ') 
    playAudio(noisy,SR,5);
end

%% Query search
match = findMatch(query_features,songs,print_len,thresh);

% Now check if the match is correct