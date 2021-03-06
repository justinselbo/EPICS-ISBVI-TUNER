hold on
x = 1 : 300;
period = 50;
fontSize =12;
y = sin(2*pi*x/period);
noiseAmplitude = 0.8;
y = y + noiseAmplitude * rand(size(y)); %you don't want to add noise, this is just for testing
plot(x, y, 'b-', 'LineWidth', 2);

set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);

set(gcf, 'Name', 'Demo by ImageAnalyst', 'NumberTitle', 'Off') 

% Now smooth with a Savitzky-Golay sliding polynomial filter
windowWidth = 15;
polynomialOrder = 3;
smoothY1 = sgolayfilt(y, polynomialOrder, windowWidth);
smoothY2 = ourOwnSgolay(y, polynomialOrder, windowWidth);
plot(x, smoothY1, 'g-', 'LineWidth', 2);
plot(x, smoothY2, 'r-', 'LineWidth', 2);
title('Signals', 'FontSize', fontSize);
legend('Noisy', 'Built-in sgolay', 'Our sgolay');