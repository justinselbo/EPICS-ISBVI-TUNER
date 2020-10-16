[y,Fs] = audioread('example.wav'); %loading the audio
info = audioinfo('example.wav');
t = 0:seconds(1/Fs):seconds(info.Duration);
t = t(1:end-1);
subplot(3,1,1);
plot(t,y);
xlabel('Time')
ylabel('Original Audio Signal')
yn = awgn(y,10,'measured');  %add noise, you don't want to add noise for the tuner. This was just for testing
subplot(3,1,2)
plot(t,yn);
xlabel('Time')
ylabel('Noisy Audio Signal')
xd = wdenoise(yn);   %denoise or filter the signal
xd2 = wdenoise(xd,3,'Wavelet','sym8',...
    'DenoisingMethod','SURE',...
    'ThresholdRule','Soft');
%xd2 = bandpass(xd2,[100,1000],Fs); %choose appropriate frequencies for
%band pass
subplot(3,1,3);
plot(t,xd2);
sound(xd2); %play the denoised audio
xlabel('Time')
ylabel('De-noised Audio Signal')

