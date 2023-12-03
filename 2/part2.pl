#!/usr/bin/perl
use strict;

open (FH, $ARGV[0]);
my $sum = 0;
while(<FH>){
  chomp;
  $_ =~ m/Game (\d+): (.*)/;
  my $id = $1; my $list = $2;
  my @rounds = split /;/, $list;
  my $red = 0;
  my $blue = 0;
  my $green = 0;
  foreach my $r (@rounds){
    if($r =~ m/(\d+) red/){
      if( $1 > $red){ $red = $1;} 
    }
    if($r =~ m/(\d+) green/){
      if( $1 > $green){ $green = $1;} 
    }
    if($r =~ m/(\d+) blue/){
      if( $1 > $blue){ $blue = $1;} 
    }
  }
  
  my $power = $red * $blue * $green;

  $sum += $power;
 
}

print "$sum\n";
