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
my %gears;

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
      #print "number is $number; len is $len\n";
      my $symbol = 0;
      for(my $i = max(($x-1),0); $i<=min($x+1,$#matrix); $i++){
        for(my $j = max($y-($len),0); $j <= min($y+1,$#{$matrix[$x]}); $j++){
          #print "checkign coordinate $i,$j\n";
          if($matrix[$i][$j] =~ m/\*/){
            #print "found asterisk $matrix[$i][$j] at $i,$j, adjacent to $number \n";
            push(@{$gears{"$i-$j"}}, $number);
          } 
        }
      } 
    }
  }
}

foreach my $asterisk (keys %gears){
  if($#{$gears{$asterisk}} == 1){
    #print "asterisk at $asterisk has 2 values: @{$gears{$asterisk}}\n";
    $sum += ($gears{$asterisk}[0] * $gears{$asterisk}[1]);
  }
}

print "$sum\n";
