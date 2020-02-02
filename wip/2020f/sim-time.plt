set xlabel "Number of simulation cases"
set ylabel "execution time(sec)"

plot "sim-time.dat" u 1:2 title "FROGS" w l
replot "sim-time.dat" u 1:3 title "trochia" w l

set terminal png
set out "sim-time.png"
replot
