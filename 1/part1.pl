#!/usr/bin/perl
use strict;

open (FH, $ARGV[0]);

my $sum = 0;

while(<FH>){
  chomp;
  my $line = $_;
  my $first = ($line =~ /([0-9]).*/)[0];
  my $last = ($line =~ /.*([0-9])/)[0];


  my $value = $first * 10 + $last;
  $sum += $value;

}

print "total is $sum\n";
