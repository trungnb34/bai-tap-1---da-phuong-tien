fs = 44100;
t = 0 : 1/fs : 5;
f1 = 440;
f2 = 2 * f1
f3 = 3 * f1;
f4 = 4 * f1;
A1 = .3; A2 = A1/2; A3 = A1/3; A4 = A1/4;
w = 0;

y1 = A1 * sin( 2 * pi * f1 * t + w );
y2 = A2 * sin( 2 * pi * f2 * t + w );
y3 = A3 * sin( 2 * pi * f3 * t + w );
y4 = A4 * sin( 2 * pi * f4 * t + w );
y = (y1+y2+y3+y4)/4;

audiowrite('melody.wav', y, fs);

Y = fft(y);
plot(abs(Y))

N = 1024
transform = fft(y,N)/N;
magTransform = abs(transform);

faxis = linspace(-fs/2,fs/2,N);
plot(faxis,fftshift(magTransform));
xlabel('Frequency (Hz)')
axis([0 length(faxis)/2, 0 max(magTransform)]) 
xt = get(gca,'XTick');  
set(gca,'XTickLabel', sprintf('%.0f|',xt));

win = 128
hop = win/2            
nfft = win
spectrogram(y,win,hop,nfft,fs,'yaxis')
yt = get(gca,'YTick');  
set(gca,'YTickLabel', sprintf('%.0f|',yt))