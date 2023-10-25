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
var y[T*P]  >= 0;
var z[T*P] binary;

# Función objetivo
minimize fobj: sum<t,i> in T*P: (370 * x[t,i] + 540 * y[t, i]);

# Restricciones
subto stockinicial: forall <i> in P:
	s[0,i] == 0;

subto prodmax: forall <t,i> in T*P:
	x[t,i] <= 120;

subto lotesexactos: forall <t,i> in T*P:
	x[t,i] == 10 * w[t,i];

subto defstock: forall <t,i> in T*P:
	s[t,i] == s[t-1,i] + x[t,i] + y[t, i] - d[t,i];

subto capacidad: forall <t> in T:
	sum <i> in P: s[t,i] <= 900;

subto limite: forall <t> in T:
	sum <i> in P: x[t,i] <= 300;

subto terc: forall <t> in T:
	sum <i> in P: y[t,i] <= 200;

subto terc_min: forall <t,i> in T*P:
	y[t,i] >= 20 * z[t, i];

subto max_y: forall <t,i> in T*P:
	y[t,i] <= 200 * z[t, i];









