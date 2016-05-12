set datafile separator ","
set title 'Hallspannung in Abhängigkeit vom Querstrom bei Silber'
set xlabel 'Querstrom I in A'
set ylabel 'Hallspannung U in V'
set fit errorvariables
u(x)=a+b*x
a=0.0000001
b=0.0001
fit u(x) 'silber.dat' using 1:($2*1e-06):(0.5):(1e-06) xyerrors via a, b
umax(x) = (a - a_err) + x * (b + b_err)
umin(x) = (a + a_err) + x * (b - b_err)
set xrange [0:22]
set yrange [0:8e-06]
set terminal wxt size 800,600
plot 'silber.dat' using 1:($2*1e-06):(0.5):(1e-06) with xyerrorbars title 'Messwerte', u(x) title 'Ausgleichsgerade', umin(x) title 'Minimale Ausgleichsgerade', umax(x) title 'Maximale Ausgleichsgerade'