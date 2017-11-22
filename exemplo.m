t=0:0.01:100;

s=sin(2*pi*120*t);
s2=sin(1*pi*120*t);
s4=sin(0.1*pi*120*t);
s3=sin(0.4*pi*120*t);

soma=s+s2+s3+s4;

%filtro criado pelo FIR
%Passa baixa
b=fir1(100,0.2,'low');
%Passa alto
b2=fir1(90,0.2,'high');

%Passa-faixa
b3=fir1(48,[0.35 0.65]);
b4=fir1(48,[0.35 0.40]);


%aplica filtros
%Baixo
y=filter(b,1,soma);
%Alto
y2=filter(b2,1,soma);

%Passa-faixa
y3=filter(b3,1,soma);
y4=filter(b4,1,soma);

%filtro baseado em FFT, usando metodo sobreposição
y5=fftfilt(b,soma);


fftf(soma,44100,'b');
figure
fftf(y,44100,'b');
figure
fftf(y2,44100,'b');
figure
fftf(y4,44100,'b');
figure
fftf(y3,44100,'b');


