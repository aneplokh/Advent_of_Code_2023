#!/usr/bin/perl
use strict;
use List::Util qw(min max);

open(FH, $ARGV[0]);

my @matrix;

while(<FH>){
  chomp;
  my @line = split //, $_;
  push @matrix, \@line;
}

my $sum = 0;

for(my $x=0; $x<=$#matrix;$x++){
  for(my $y=0;$y<=$#{$matrix[$x]};$y++){
    if($matrix[$x][$y] =~ m/[0-9]/){
      my $number = $matrix[$x][$y];
      my $len = 1;
      if($matrix[$x][++$y] =~ m/[0-9]/){
        $number .= $matrix[$x][$y];
        $len++;
        if($matrix[$x][++$y] =~ m/[0-9]/){
          $number .= $matrix[$x][$y];
          $len++;
        }else{
          --$y;
        }
      } else{
        --$y;
      }

      my $symbol = 0;
      for(my $i = max(($x-1),0); $i<=min($x+1,$#matrix); $i++){
        for(my $j = max($y-($len),0); $j <= min($y+1,$#{$matrix[$x]}); $j++){
          if($matrix[$i][$j] !~ m/[0-9\.]/){
            $symbol = 1;
          } 
        }
      } 
      if($symbol == 1){
        #print "$number is a part number\n";
        $sum += $number;
      }
    }
  }
}

print "$sum\n";
