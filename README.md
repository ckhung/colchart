# colchart

[Drawing a pseudo 3D bar graph
in gnuplot](http://lowrank.net/gnuplot/plotpm3d-e.html#6.9)
requires preprocessing the data.
This program is the answer to the homework problem
posed by the above link.

Usage:
    ./mat2list.pl -r '1:' -c '20:20' freq0.txt | ./pt2sq.pl -y 20 > freq.txt
Then inside gnuplot:
    load "colchart.gpt"
to draw the column chart (3d bar chart) and
generate an svg file "colchart.svg".

![a column chart (3-d bar chart) drawn with gnuplot](https://raw.githubusercontent.com/ckhung/colchart/master/colchart.svg)
