function tau_G = G2Rn(in)
    q=in(1:2);
    parameters2;
    q1=q(1);
    q2=q(2);
    %tau_G(1,1)=(m1*lc1+m2*l1)*g*sin(q1)+m2*g*lc2*sin(q1+q2);
    %tau_G(2,1)=m2*g*lc2*sin(q1+q2);
    
    tau_G=[ g*(lc1*m1*sin(q1) + lc2*m2*sin(q1 + q2) + l1*m2*sin(q1)), ;
g*lc2*m2*sin(q1 + q2), ;
];
end