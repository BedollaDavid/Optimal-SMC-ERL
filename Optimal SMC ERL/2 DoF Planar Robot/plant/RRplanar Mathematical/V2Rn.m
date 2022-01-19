function tau_V = V2Rn(in)
    q=in(1:2);
    dq=in(3:4);
    parameters2;
    q1=q(1);
    q2=q(2);
    dq1=dq(1);
    dq2=dq(2);  
%     % Matriz de coriolis y fuerza centripeta
%     C11=-m2*l1*lc2*sin(q2)*dq2;
%     C12=-m2*l1*lc2*sin(q2)*(dq1+dq2);
%     C21= m2*l1*lc2*sin(q2)*dq1;
%     C22=0;
%     C=[C11,C12;C21,C22];
C=[ -1.0*l1*dq2*lc2*m2*sin(q2), -l1*lc2*m2*sin(q2)*(dq1 + dq2), ;
l1*dq1*lc2*m2*sin(q2), 0.0, ;
];

tau_V=C*dq;
end


