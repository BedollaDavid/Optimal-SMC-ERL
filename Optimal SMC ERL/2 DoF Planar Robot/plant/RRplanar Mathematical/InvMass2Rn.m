function tau_M = InvMass2Rn(in)
q=in(1:2);
tau=in(3:4);
parameters2;

q1=q(1);
q2=q(2);
%Matriz de inercia
% M11=m1*lc1*lc1+m2*l1*l1+m2*lc2*lc2+2*m2*l1*lc2*cos(q2)+I1+I2;
% M12=m2*lc2*lc2+m2*l1*lc2*cos(q2)+I2;
% M21=m2*lc2*lc2+m2*l1*lc2*cos(q2)+I2;
% M22=m2*lc2*lc2+I2;
% M=[M11 M12; M21 M22];

M=[ I1 + I2 + l1^2*m2 + lc1^2*m1 + lc2^2*m2 + 2.0*l1*lc2*m2*cos(q2), I2 + lc2^2*m2 + l1*lc2*m2*cos(q2), ;
I2 + lc2^2*m2 + l1*lc2*m2*cos(q2), I2 + lc2^2*m2, ;
];

tau_M=inv(M)*tau;
end