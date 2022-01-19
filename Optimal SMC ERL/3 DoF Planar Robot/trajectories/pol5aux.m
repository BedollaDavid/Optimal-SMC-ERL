%	POL5AUX	Funci�n auxiliar de POL5 que genera cada tramo de una trayectoria articular
%		con interpolaci�n de polinomios qu�nticos
%
%	[QCOEF,TIME,Q_T,QD_T,QDD_T] = POL5AUX (Q,QD,QDD,T,STEP)
%
%	Los par�metros de la funci�n son:
%
%	- Q:	matriz con tantas filas como articulaciones, que contiene en la primera columna
%		las posiciones iniciales deseadas y en la segunda, las posiciones finales deseadas
%		para un determinado tramo.
%	- QD:	matriz con tantas filas como articulaciones, que contiene en la primera columna
%		las velocidades iniciales deseadas y en la segunda, las velocidades finales deseadas
%		para un determinado tramo.
%	- QDD:	matriz con tantas filas como articulaciones, que contiene en la primera columna
%		las aceleraciones iniciales deseadas y en la segunda, las aceleraciones finales
%		deseadas para un determinado tramo.
%	- T:	vector que contiene los instantes inicial y final ([t0 tf]) del tramo.
%	- STEP:	Paso con el que se calculan la posici�n, velocidad y aceleraci�n resultantes.
%
%	Esta funci�n devuelve:
%
%	- QCOEF	matriz que contiene en cada fila los coeficientes del polinomio c�bico soluci�n
%		para cada una de las variables articulares. La primera columna se corresponde con
%		la potencia c�bica y la �ltima con el t�rmino independiente.
%	- TIME	vector tiempo con los instantes para los que se calculan las matrices Q_T,
%		QD_T y QDD_T que contienen los valores de la posici�n, velocidad y aceleraci�n
%		articular resultantes.
%	- Q_T	matriz que contiene en cada fila los valores de posici�n correspondientes a cada
%		articulaci�n.
%	- QD_T	matriz que contiene en cada fila los valores de velocidad correspondientes a
%		cada articulaci�n.
%	- QDD_T	matriz que contiene en cada fila los valores de aceleraci�n correspondientes a
%		cada articulaci�n.

%	Copyright (C) Iv�n Maza 2001

function [Qcoef,time,q_t,qd_t,qdd_t] = pol5aux (q,qd,qdd,t,step)

[m,n] = size(q);
t0 = t(1);
tf = t(2);
td = tf-t0;

for w=1:m
   q0 = q(w,1);
   qf = q(w,2);
   qd0 = qd(w,1);
   qdf = qd(w,2);
   qdd0 = qdd(w,1);
   qddf = qdd(w,2);
	a0 = q0;
	a1 = qd0;
	a2 = qdd0/2;
	a3 = (20*qf-20*q0-(8*qdf+12*qd0)*td-(3*qdd0-qddf)*td^2)/(2*td^3);
	a4 = (30*q0-30*qf+(14*qdf+16*qd0)*td+(3*qdd0-2*qddf)*td^2)/(2*td^4);
	a5 = (12*qf-12*q0-(6*qdf+6*qd0)*td-(qdd0-qddf)*td^2)/(2*td^5);
	Qcoef(w,:) = [a5 a4 a3 a2 a1 a0];

	k = 1;
	for taux=0:step:td
   	q_t(w,k) = sum(Qcoef(w,:).*[taux^5 taux^4 taux^3 taux^2 taux 1]);
   	qd_t(w,k) = sum(Qcoef(w,:).*[5*taux^4 4*taux^3 3*taux^2 2*taux 1 0]);
   	qdd_t(w,k) = sum(Qcoef(w,:).*[20*taux^3 12*taux^2 6*taux 2 0 0]);
   	k = k+1;
	end
end
time=t0:step:tf;
