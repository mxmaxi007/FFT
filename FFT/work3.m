clear;
%[M, fs, nbits]=wavread('G:\新建文件夹\语音信号处理\homework\459707069_4_作业2和3所用wav文件\connected.wav');
[M, fs, nbits]=wavread('G:\新建文件夹\语音信号处理\homework\459707069_4_作业2和3所用wav文件\isolated.wav');
M=M';
len=length(M);%总共的采样点数

stage=floor(log2(len));
win=2^stage;%一帧的窗口长度
frame_num=floor(len/win);%帧数

X1_am=fre_am(M, win, frame_num);%使用自己实现的fft算法计算频谱幅度
X2_am=abs(fft(M(1:win)));%使用matlab中fft算法计算频谱幅度


freq=1:win/2;%频域区间
freq=freq*fs/win;

t=1:len;%时域区间
t=t/fs;

figure(1);
subplot(3,1,1);
plot(t, M);
grid on
xlabel('Time/s');
ylabel('Amplitude');
title('Original Waveform');

subplot(3,1,2);
plot(freq, X1_am(1:win/2));
grid on
xlabel('Frequency/Hz');
ylabel('Amplitude');
title('My FFT');

subplot(3,1,3);
plot(freq, X2_am(1:win/2));
grid on
xlabel('Frequency/Hz');
ylabel('Amplitude');
title('MATLAB FFT');

%画出宽带语谱图
win=256;%一帧的窗口长度
shift=32;%窗移
base=0;%归一化最低基准值
mode=1;%显示模式（0灰度图/1彩色图）
gray=64;%语谱图的灰度级别

figure(2);
sogram(M, fs, win, shift, base, mode, gray);
title('Broad Band Spectrum(dB)');

%画出窄带语谱图
win=2048;%一帧的窗口长度
shift=128;%窗移
base=0;%归一化最低基准值
mode=1;%显示模式（0灰度图/1彩色图）
gray=64;%语谱图的灰度级别

figure(3);
sogram(M, fs, win, shift, base, mode, gray);
title('Narrow Band Spectrum(dB)');