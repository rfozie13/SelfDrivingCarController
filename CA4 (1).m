%CA 4;
%Case 1;
K= 2; %Chosen
wnsquared = 0.2*K;
Wn = sqrt(wnsquared);
Zeta = 1/(2*Wn); %Needs to be less than one and greater than zero
num = wnsquared;
den = [1, 1, 0.2*K];
sys = tf(num, den); 
figure(1)
step(sys);
Theta = acos(Zeta);
Wd = Wn*sqrt(1-(Zeta)^2);
RiseTime = (pi - Theta)/Wd; 
PeakTime = pi/(Wd);
SettlingTime = 4/(Zeta*Wn);
Overshoot = exp(-1*Zeta*Wn*(pi/Wd));
Kp = dcgain(sys);
ess = 1/(1+Kp);
T = feedback(sys,1);
poles = pole(T);

%CA 4;
%Case 1;
Sigma2=0.4546;
Wd2 = 0.7634;
numerator = [0.2, 4, 20];
num2 = conv(K,numerator);
den2 = [1, 21, 120, 100, 20*K];
sys2 = tf(num2, den2);
hold on
step(sys2)
T2 = feedback(sys2,1);
poles2 = pole(T2);
Theta2 = atan(Wd2/Sigma2);
Zeta2 = cos(Theta2);
Wn2 = Wd2/(sqrt(1-(Zeta2)^2));
RiseTime2 = (pi - Theta2)/Wd2; 
PeakTime2 = pi/Wd2;
SettlingTime2 = 4/(Sigma2);
Overshoot2 = exp(-Sigma2*Wn2*(pi/Wd2));
Kp2 = dcgain(sys2);
ess2 = 1/(1+Kp2); 


