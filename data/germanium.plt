set datafile separator ","
set title 'Hallspannung in Abhängigkeit vom Querstrom bei Germanium'
set xlabel 'Querstrom I in A'
set ylabel 'Hallspannung U in V'
set fit errorvariables
u(x)=a+b*x
a=0.0000001
b=0.0001
fit u(x) 'germanium.dat' using ($1*1e-03):($2*1e-03):(0.5e-03):(1e-03) xyerrors via a, b
umax(x) = (a - a_err) + x * (b + b_err)
umin(x) = (a + a_err) + x * (b - b_err)
set xrange [0:32e-03]
set yrange [0:300e-03]
set terminal wxt size 800,600
plot 'germanium.dat' using ($1*1e-03):($2*1e-03):(0.5e-03):(1e-03) with xyerrorbars title 'Messwerte', u(x) title 'Ausgleichsgerade', umin(x) title 'Minimale Ausgleichsgerade', umax(x) title 'Maximale Ausgleichsgerade'