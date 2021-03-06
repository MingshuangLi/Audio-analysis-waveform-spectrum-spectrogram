%Mingshuang Li, UT Austin, 2020.06.06
%Waveform and spectrum, based on matlab
clear;

wavefile = input('Please type in the wave file name: ', 's');
[waveform, fs] = audioread(wavefile);

waveform = waveform(:,1);
    dt = 1/fs;
    t = 0:dt:(length(waveform)*dt)-dt;
    plot(t(1:fs/100),waveform(1:fs/100)); xlabel('Seconds'); ylabel('Amplitude');

m = length(waveform);       % original sample length
n = input('FFT frequency: ');
y = fft(waveform,n);

f = (0:n-1)*(fs/n);
intensity = 10*log10(abs(y))+ 58.227; %calibrated with praat    

figure;
plot(f(1:fix(n/10)),intensity(1:fix(n/10))) % Frequency range of the FFT analysis can be modified by changing the n/10
xlabel('Frequency (Hz)')
ylabel('Intensity (dB)')