hold on
x = 0:0.0001:5; %time in milliseconds
frequency = 1.1; %frequency of wave in kHz
samplingFrequency = 9; %sampling frequency in kHz
samplingPeriod = 1 / samplingFrequency; %sampling Frequency in ms
samplingDomain = 0.2:samplingPeriod:5;
fontSize = 12;
y = sin(2*pi*x*frequency);
samplingY = sin(2*pi*samplingDomain*frequency);
%noiseAmplitude = 0.1;
%y = y + noiseAmplitude * rand(size(y)); %you don't want to add noise, this is just for testing
%samplingY = samplingY + noiseAmplitude * rand(size(samplingY)); %you don't want to add noise, this is just for testing
plot(x, y, 'b-', 'LineWidth', 2);
plot(samplingDomain, samplingY, 'r-', 'LineWidth', 2);
legend('1.1 kHz sound wave', '9 kHz sampling');
xlabel('Time (ms)')