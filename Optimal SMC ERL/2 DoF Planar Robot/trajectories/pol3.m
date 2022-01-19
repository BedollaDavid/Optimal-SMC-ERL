%	POL3	Calcula las trayectorias articulares resultantes de emplear polinomios c�bicos
%
%	[QCOEF,TIME,Q_T,QD_T,QDD_T] = POL3 (Q,QD,T0,TIJ,STEP)
%
%	Los par�metros de la funci�n son:
%
%	- Q:	matriz con tantas filas como articulaciones, que contiene en cada columna las
%		posiciones articulares deseadas para el punto inicial,los puntos de paso y el
%		punto final.
%	- QD:	matriz con tantas filas como articulaciones, que contiene en cada columna las
%		velocidades articulares deseadas para el punto inicial,los puntos de paso y el
%		punto final.
%	- T0:	par�metro que contiene el instante inicial
%	- TIJ:	Vector que contiene la duraci�n de los intervalos entre puntos.
%	- STEP:	Paso con el que se calculan la posici�n, velocidad y aceleraci�n resultantes.
%
%	Esta funci�n devuelve:
%
%	- QCOEF	matriz de tres dimensiones, que contiene en cada fila los coeficientes del
%		polinomio c�bico soluci�n para cada una de las variables articulares. La primera
%		columna se corresponde con la potencia c�bica y la �ltima con el t�rmino indepen-
%		diente. El tercer �ndice de la matriz hace referencia a la articulaci�n a la que
%		le corresponden los coeficientes.
%	- TIME	vector tiempo con los instantes para los que se calculan las matrices Q_T,
%		QD_T y QDD_T que contienen los valores de la posici�n, velocidad y aceleraci�n
%		articular resultantes.
%	- Q_T	matriz que contiene en cada fila los valores de posici�n correspondientes a
%		cada articulaci�n.
%	- QD_T	matriz que contiene en cada fila los valores de velocidad correspondientes a
%		cada articulaci�n.
%	- QDD_T	matriz que contiene en cada fila los valores de aceleraci�n correspondientes a
%		cada articulaci�n.

%	Copyright (C) Iv�n Maza 2001


function [Qcoef, time, q_t, qd_t, qdd_t] = pol3 (q, qd, t0, tij, step)

l = size(tij,2);

if l==1
    tij=(tij/(size(q,2)-1))*ones(size(q,1),size(q,2)-1);
    l = size(tij,2);
end

[h,n] = size(q);
[o,m] = size(qd);
if (n~=m) | (o~=h)
   error('Las dimensiones de las matrices de especificaci�n de posici�n y velocidad deben ser id�nticas')
end

if (l~=n-1)
   error('La dimensi�n del vector con la duraci�n de los intervalos no es correcta')
end




Qcoef = [];


for w=1:h
   t_ini = t0;   
   qaux = q(w,:);
   qdaux = qd(w,:);
   qt = [];
   qdt = [];
   qddt = [];
	for i=1:1:n-1
   	[Qcoef(i,:,w), taux, q_taux, qd_taux, qdd_taux] = pol3aux([qaux(i) qaux(i+1)],[qdaux(i) qdaux(i+1)],[t_ini t_ini+tij(w,i)],step);
   	qt = [qt q_taux(1:length(q_taux)-1)];
    qdt = [qdt qd_taux(1:length(qd_taux)-1)];
   	qddt = [qddt qdd_taux(1:length(qdd_taux)-1)];         
      t_ini = t_ini+tij(i);
    end
	q_t(w,:) = [qt q_taux(length(q_taux))];
	qd_t(w,:) = [qdt qd_taux(length(qd_taux))];
   qdd_t(w,:) = [qddt qdd_taux(length(qdd_taux))];
end



%tfinal = sum (tij,2)+t0;
%time = t0:step:tfinal;

time = t0:step:size(q_t,2)*step-step;

q_t   = [time; q_t]';
qd_t  = [time; qd_t]';
qdd_t = [time; qdd_t]';
end