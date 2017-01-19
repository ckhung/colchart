#!/usr/bin/perl -w
# homework as assigned by http://lowrank.net/gnuplot/plotpm3d-e.html

use Getopt::Std;
use strict;
my (%opts, $numberRE);

%opts = (
    x => 1,	# x spacing
    y => 1,	# y spacing
);

getopts('x:y:', \%opts);

my ($data, $i, $x, $y, $z);

$i = 0;
while (<>) {
    chomp;
    s/#.*//;
    next if /^\s*$/;
    ($x, $y, $z) = split;
    $data->{int($x/$opts{x}+0.5)*$opts{x}}{int($y/$opts{y}+0.5)*$opts{y}} = $z;
    ++$i;
}

foreach $x (sort { $a<=>$b} keys %$data) {
    my ($x0, $x1) = ($x-$opts{x}/2, $x+$opts{x}/2);
    my (@ys) = sort { $a<=>$b} keys %{$data->{$x}};
    foreach $y (@ys) {
	my ($y0, $y1, $d) = ($y-$opts{y}/2, $y+$opts{y}/2, $data->{$x}{$y});
	print "$x0 $y0 $d\n$x0 $y1 $d\n";
    }
    print "\n";
    foreach $y (@ys) {
	my ($y0, $y1, $d) = ($y-$opts{y}/2, $y+$opts{y}/2, $data->{$x}{$y});
	print "$x1 $y0 $d\n$x1 $y1 $d\n";
    }
    print "\n";
}
