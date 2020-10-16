x = 1 : 300;
period = 50;
fontSize =12;
y = sin(2*pi*x/period);
noiseAmplitude = 0.8;
y = y + noiseAmplitude * rand(size(y)); %you don't want to add noise, this is just for testing
subplot(2,1,1);
plot(x, y, 'b-', 'LineWidth', 2);
title('Noisy Signal', 'FontSize', fontSize);

set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);

set(gcf, 'Name', 'Demo by ImageAnalyst', 'NumberTitle', 'Off') 

% Now smooth with a Savitzky-Golay sliding polynomial filter
windowWidth = 27;
polynomialOrder = 3;
smoothY = sgolayfilt(y, polynomialOrder, windowWidth);
subplot(2,1,2);
plot(x, smoothY, 'b-', 'LineWidth', 2);
title('Smoothed Signal', 'FontSize', fontSize);