nn=length(in);
if nn==4
    option=in(4);
end
if nn==7
    option=in(7);
end
if nn==3 || nn==6
    option=1;
end
gain=option;
%parametros del robot de 2 grados de libertad
L1=0.34; L2=0.3; L3=0.3;
lc1=0.0983;  lc2=0.0229; lc3=0.0229;
m1=gain*3; m2=gain*2; m3=gain*1;
Izz1=gain*0.0229; Izz2=gain*0.0229; Izz3=gain*0.0229;
g=9.81;