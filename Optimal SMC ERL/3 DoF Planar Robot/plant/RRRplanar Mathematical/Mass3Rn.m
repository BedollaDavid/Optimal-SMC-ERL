function tau_M = Mass3Rn(in)
q=in(1:3);
tau=in(4:6);
parameters3;

q1=q(1);
q2=q(2);
q3=q(3);
M=[ Izz1 + Izz2 + Izz3 + L1^2*m2 + L1^2*m3 + L2^2*m3 + lc1^2*m1 + lc2^2*m2 + lc3^2*m3 + 2.0*L1*lc3*m3*cos(q2 + q3) + 2.0*L1*L2*m3*cos(q2) + 2.0*L1*lc2*m2*cos(q2) + 2.0*L2*lc3*m3*cos(q3), Izz2 + Izz3 + L2^2*m3 + lc2^2*m2 + lc3^2*m3 + L1*lc3*m3*cos(q2 + q3) + L1*L2*m3*cos(q2) + L1*lc2*m2*cos(q2) + 2.0*L2*lc3*m3*cos(q3), Izz3 + lc3^2*m3 + L1*lc3*m3*cos(q2 + q3) + L2*lc3*m3*cos(q3), ;
Izz2 + Izz3 + L2^2*m3 + lc2^2*m2 + lc3^2*m3 + L1*lc3*m3*cos(q2 + q3) + L1*L2*m3*cos(q2) + L1*lc2*m2*cos(q2) + 2.0*L2*lc3*m3*cos(q3), Izz2 + Izz3 + L2^2*m3 + lc2^2*m2 + lc3^2*m3 + 2.0*L2*lc3*m3*cos(q3), Izz3 + lc3^2*m3 + L2*lc3*m3*cos(q3), ;
Izz3 + lc3^2*m3 + L1*lc3*m3*cos(q2 + q3) + L2*lc3*m3*cos(q3), Izz3 + lc3^2*m3 + L2*lc3*m3*cos(q3), Izz3 + lc3^2*m3, ;
];

tau_M=M*tau;
end