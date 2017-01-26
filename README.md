# colchart

[Drawing a pseudo 3D bar graph
in gnuplot](http://lowrank.net/gnuplot/plotpm3d-e.html#6.9)
requires preprocessing the data.
This program is the answer to the homework problem
posed by the above link.

## 1. For the Impatient ##

Usage:
```bash
    ./mat2list.pl -r '1:' -c '20:20' freq0.txt | ./pt2sq.pl -y 20 > freq.txt
```
Then inside gnuplot:
```gnuplot
    load "colchart.gpt"
```
to draw the column chart (3d bar chart) and
generate an svg file "colchart.svg".

![a column chart (3-d bar chart) drawn with gnuplot](https://ckhung.github.io/a/m/17/colchart.svg)

## 2. mat2list.pl ##

This script reads a csv file or a space-delimited tabulated
matrix of numbers and converts it into lines of the format:
```row_label column_label matrix_entry```.
An additional blank line is printed
after the last entry of each row.
When fed as a data file to the "splot" command of gnuplot,
this kind of file is interpreted as x-, y-, and z-coordinates,
and the result is a grid plot.
The following options are available:

```-c m:n``` column labels (x-coordinates)
starts at m and increments by n for each column.

```-r m:n``` row labels (y-coordinates)
starts at m and increments by n for each row.

``` -d ':'``` input delimiter is ':' instead of ','

``` -t``` transpose the output. That is,
output lines of the format instead:
```row_label column_label matrix_entry```.

For -c and -r, the starting number is 0 if omitted,
and the step number is 1 if omitted.
Instead of a pair of colon-separated numbers,
the argument to -r or -c can also be a list of
space-separated numbers, directly specifying
the labels themselves.

## 3. pt2sq.pl ##

Suppose you have a data file consisting of lines of the format:
```x_coord y_coord z_coord```.
This script converts ...

