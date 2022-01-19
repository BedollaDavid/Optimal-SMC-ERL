function tau_G = G3Rn(in)
    q=in(1:3);
    parameters3;
    q1=q(1);
    q2=q(2);
    q3=q(3);
%     tau_G=[ g*(lc1*m1*sin(q1) + lc3*m3*sin(q1 + q2 + q3) + L2*m3*sin(q1 + q2) + lc2*m2*sin(q1 + q2) + L1*m2*sin(q1) + L1*m3*sin(q1)), ;
% L2*g*m3*sin(q1 + q2) + g*lc2*m2*sin(q1 + q2) + 1.0*g*lc3*m3*sin(q1 + q2 + q3), ;
% g*lc3*m3*sin(q1 + q2 + q3), ;
% ];
tau_G=[ g*(lc1*m1*sin(q1) + lc3*m3*sin(q1 + q2 + q3) + L2*m3*sin(q1 + q2) + lc2*m2*sin(q1 + q2) + L1*m2*sin(q1) + L1*m3*sin(q1));
    L2*g*m3*sin(q1 + q2) + g*lc2*m2*sin(q1 + q2) + 1.0*g*lc3*m3*sin(q1 + q2 + q3);
    g*lc3*m3*sin(q1 + q2 + q3), ;
];
    
end