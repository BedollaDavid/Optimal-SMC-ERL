%	POL3AUX	Funci�n auxiliar de POL3 que genera cada tramo de una trayectoria articular
%		con interpolaci�n de polinomios c�bicos
%
%	[QCOEF,TIME,Q_T,QD_T,QDD_T] = POL3AUX (Q,QD,T,STEP)
%
%	Los par�metros de la funci�n son:
%
%	- Q:	matriz con tantas filas como articulaciones, que contiene en la primera columna
%		las posiciones iniciales deseadas y en la segunda, las posiciones finales deseadas
%		para un determinado tramo.
%	- QD:	matriz con tantas filas como articulaciones, que contiene en la primera columna
%		las velocidades iniciales deseadas y en la segunda, las velocidades finales deseadas
%		para un determinado tramo.
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

function [Qcoef,time,q_t,qd_t,qdd_t] = pol3aux(q,qd,t,step)

[m,n] = size(q);
t0 = t(1);
tf = t(2);
td = tf-t0;

for w=1:m
   q0 = q(w,1);
   qf = q(w,2);
   qd0 = qd(w,1);
   qdf = qd(w,2);
   a0 = q0;
   a1 = qd0;
   a2 = (3/td^2)*(qf-q0)-(2/td)*qd0-(1/td)*qdf;
   a3 = (-2/td^3)*(qf-q0)+(1/td^2)*(qdf+qd0);
   Qcoef(w,:) = [a3 a2 a1 a0];

	k = 1;
	for taux=0:step:td
   	q_t(w,k) = sum(Qcoef(w,:).*[taux^3 taux^2 taux 1]);
   	qd_t(w,k) = sum(Qcoef(w,:).*[3*taux^2 2*taux 1 0]);
   	qdd_t(w,k) = sum(Qcoef(w,:).*[6*taux 2 0 0]);
   	k = k+1;
	end
end
time = t0:step:tf;   
