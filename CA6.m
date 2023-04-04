% CA 6
%Uncompensated design
%Step 1
ognum = [0.4, 8, 40];
ogden = [1, 21, 120, 100, 20];
CLTFOG = tf(ognum, ogden);
figure(1);
step(CLTFOG);
num2 = 20;
den2 = [1, 21, 121, 100, 0];
sys2 = tf(num2, den2);
numsse = [0.4, 8, 40];
densse = [1, 21, 120, 100, 0, 0, 40];
syssse = tf(numsse, densse);
T2 = feedback(syssse,1); 
poles2 = pole(sys2); 
Kp2 = dcgain(sys2);
ess2 = 1/(1+Kp2); 
figure(1);
rlocus(sys2);
TsUncomp = 4/0.45; %Pulled the denominator from the pole location
TpUncomp = pi/0.43; %Pulled the denominator from the pole location
Zeta = 0.723; %From root locus plot
     
%Step 2
TpComp1 = 0.75 * TpUncomp; %Desired Peak Time
Wd = 3.14159/TpComp1; %Desired imaginary pole location
Alpha = acosd(Zeta);
X = tand(Alpha);
Sigma = Wd/X; %Desired real pole location
TsComp1 = 4/Sigma;
    %Angle Contributions
Pole1 = 180 - atand((1.1494-Wd)/(10.0286 -Sigma)); %Angle contribution for complex 
Pole2 = atand(Wd/(.6324-Sigma)); %Angle contribution at s = -1
Pole3 = 180 - atand(Wd/Sigma - 0.3104);
ThetaC = Pole1 + Pole2 + Pole3 - 180;
Zc = (Wd/(tand(ThetaC))) + Sigma;

%Step 3 
num3 = [20, 93.2];
den3 = [1, 21, 121, 100, 0];
sys3 = tf(num3,den3);
figure(2);
rlocus(sys3);
Kcomp = .726; %Found on root locus plot
T3 = feedback(sys3, 1);
poles3 = pole(T3);
Kp3 = dcgain(sys3);
ess3 = 1/(1+Kp3);
TpComp2 = 3.14159/.8224;
TsComp2 = 4/.8224;

