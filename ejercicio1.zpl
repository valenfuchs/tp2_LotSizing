# Productos
set P := {"A", "B", "C", "D", "E"};

# Meses
set T := {1 .. 24};
set W := {0 .. 24};

# Demandas de cada producto
param d[T*P] := read "datos.dat" as "n+";

# Variables
var x[T*P] >= 0;
var s[W*P] >= 0;
var w[T*P] integer >= 0;

# Función objetivo
minimize fobj: sum<t,i> in T*P: 370 * x[t,i];

# Restricciones
subto stockinicial: forall <i> in P:
	s[0,i] == 0;

subto prodmax: forall <t,i> in T*P:
	x[t,i] <= 120;

subto lotesexactos: forall <t,i> in T*P:
	x[t,i] == 10 * w[t,i];

subto defstock: forall <t,i> in T*P:
	s[t,i] == s[t-1,i] + x[t,i] - d[t,i];

subto capacidad: forall <t> in T:
	sum <i> in P: s[t,i] <= 900;




