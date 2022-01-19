nn=length(in);
if nn==3
    option=in(3);
end
if nn==5
    option=in(5);
end
if nn==2 || nn==4
    option=1;
end
gain=option;
%parametros del robot de 2 grados de libertad
l1=0.34; l2=0.3;
lc1=0.0983;  lc2=0.0229;
m1=gain*3; m2=gain*2;
I1=gain*0.0229; I2=gain*0.0229;
b1=0; b2=0; g=9.81;
fc1=0; fc2=0;