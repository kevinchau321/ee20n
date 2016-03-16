% spectrogramTest.m

%% Part 1: Frequency-domain analysis of testAudio and scrambledAudio

% load and listen to the signals
load testAudio.mat
% find the DFT of testAudio and scrambledAudio
testDFT= fft(testAudio);
scrambledDFT = fft(scrambledAudio);
w=[0:2*pi/8016:2*pi]

% plot the DFT of testAudio and scrambledAudio
figure(4)
hold
plot(w,abs(testDFT));
plot(w,abs(scrambledDFT),'r');


%% Part 2: Find spectrograms of the two signals

window = 256;
NFFT = 256;
noverlap = 250;

figure(1) % plot the spectrogram of testAudio
[S F T P] = spectrogram(testAudio,window,noverlap,NFFT,fs);
imagesc(T,F,10*log10(P)); axis tight;
axis('xy'); colormap(jet);
xlabel('Time (sec)'); ylabel('Freq (kHz)');


figure(2) % plot the spectrogram of scrambledAudio
[S F T P] = spectrogram(scrambledAudio,window,noverlap,NFFT,fs);
imagesc(T,F,10*log10(P)); axis tight;
axis('xy'); colormap(jet);
xlabel('Time (sec)'); ylabel('Freq (kHz)');



%% Part 3: Find the mystery signal that generates the spectrogram

fs = 1000;

figure(3) % test out your signal by plotting the spectrogram
hold
t = [0:1/1000:2]
c= 261.63
note1=sin(2*pi*c*t);
[S F T P] = spectrogram(note1,window,noverlap,NFFT,fs);
imagesc(T,F,10*log10(P)); axis tight;
axis('xy'); colormap(jet);
xlabel('Time (sec)'); ylabel('Freq (kHz)')

t2=[0:1/1000:2]
note2=sin((500/1000)*2*pi*c*t2.^2);

mysterySignal= horzcat(note1, note2);

[S F T P] = spectrogram(mysterySignal,window,noverlap,NFFT,fs);
imagesc(T,F,10*log10(P)); axis tight;
axis('xy'); colormap(jet);
xlabel('Time (sec)'); ylabel('Freq (kHz)')
