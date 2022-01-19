function tau_V = V3Rn(in)
    q=in(1:3);
    dq=in(4:6);
    parameters3;
    q1=q(1);
    q2=q(2);
    q3=q(3);
    dq1=dq(1);
    dq2=dq(2);
    dq3=dq(3);
    % Matriz de coriolis y fuerza centripeta
    C=[ - L1*dq2*lc3*m3*sin(q2 + q3) - L1*dq3*lc3*m3*sin(q2 + q3) - L1*L2*dq2*m3*sin(q2) - L1*dq2*lc2*m2*sin(q2) - L2*dq3*lc3*m3*sin(q3), - L1*dq1*lc3*m3*sin(q2 + q3) - L1*dq2*lc3*m3*sin(q2 + q3) - L1*dq3*lc3*m3*sin(q2 + q3) - L1*L2*dq1*m3*sin(q2) - L1*L2*dq2*m3*sin(q2) - L1*dq1*lc2*m2*sin(q2) - L1*dq2*lc2*m2*sin(q2) - L2*dq3*lc3*m3*sin(q3), -lc3*m3*(L1*sin(q2 + q3) + L2*sin(q3))*(dq1 + dq2 + dq3), ;
L1*dq1*lc3*m3*sin(q2 + q3) + L1*L2*dq1*m3*sin(q2) + L1*dq1*lc2*m2*sin(q2) - 1.0*L2*dq3*lc3*m3*sin(q3), -1.0*L2*dq3*lc3*m3*sin(q3), -L2*lc3*m3*sin(q3)*(dq1 + dq2 + dq3), ;
lc3*m3*(L1*dq1*sin(q2 + q3) + L2*dq1*sin(q3) + L2*dq2*sin(q3)), L2*lc3*m3*sin(q3)*(dq1 + dq2), 0.0, ;
];
    tau_V=C*dq;
end


