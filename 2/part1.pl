#!/usr/bin/perl
use strict;

open (FH, $ARGV[0]);
my $sum = 0;
while(<FH>){
  chomp;
  $_ =~ m/Game (\d+): (.*)/;
  my $id = $1; my $list = $2;
  my @rounds = split /;/, $list;
  my $valid = 1;
  foreach my $r (@rounds){
    if($r =~ m/(\d+) red/){
      if( $1 > 12){ $valid = 0;} 
    }
    if($r =~ m/(\d+) green/){
      if( $1 > 13){ $valid = 0;} 
    }
    if($r =~ m/(\d+) blue/){
      if( $1 > 14){ $valid = 0;} 
    }
  }
 
  if($valid == 1){ $sum += $id };
}

print "$sum\n";
