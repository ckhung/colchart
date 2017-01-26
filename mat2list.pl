#!/usr/bin/perl -w

use Getopt::Std;
use strict;
my (%opts, $numberRE);

%opts = (
    d => ',',	# delimiter
    c => ':',	# column values
    r => ':',	# row values
    t => undef,	# transpose?
);

$numberRE = '[-+\d\.Ee]*';

getopts('d:c:r:t', \%opts);

my ($c0, $cinc, @clab, $r0, $rinc, @rlab);

if ($opts{c} =~ /^($numberRE):($numberRE)$/) {
    $c0 = $1 ? $1 : 0;
    $cinc = $2 ? $2 : 1;
    @clab = ();
} else {
    @clab = split(' ', $opts{c});
    $c0 = $cinc = 0;
}
if ($opts{r} =~ /^($numberRE):($numberRE)$/) {
    $r0 = $1 ? $1 : 0;
    $rinc = $2 ? $2 : 1;
    @rlab = ();
} else {
    @rlab = split(' ', $opts{r});
    $r0 = $rinc = 0;
}
# if ($cinc) { print "$c0 $cinc\n"; } else { print "$opts{c}\n==>\n@clab\n"; }

sub index2label {
    my ($r, $c) = @_;
    return ($rinc ? $r0 + $r*$rinc : $rlab[$r],
	    $cinc ? $c0 + $c*$cinc : $clab[$c]);
}

my ($i, $j, @row);

$i = 0;
while (<>) {
    s/#.*//;
    chomp;
    next if /^\s*$/;
    @row = split($opts{d});
    for ($j=0; $j<=$#row; ++$j) {
	my ($r, $c) = index2label($i, $j);
	print $opts{t} ? "$c $r $row[$j]\n" : "$r $c $row[$j]\n";
    }
    print "\n";
    ++$i;
}

