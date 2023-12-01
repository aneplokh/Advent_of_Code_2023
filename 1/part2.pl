#!/usr/bin/perl
use v5.10;
use strict;
use experimental qw( switch );

open (FH, $ARGV[0]);

my $sum = 0;

while(<FH>){
  chomp;
  my $line = $_;
  #print "$line";

  my $first = ($line=~/([0-9]|one|two|three|four|five|six|seven|eight|nine).*/)[0];
  my $last = ($line=~/.*([0-9]|one|two|three|four|five|six|seven|eight|nine)/)[0];

  given($first){
    when("one") { $first = 1;}
    when("two") { $first = 2;}
    when("three") { $first = 3;}
    when("four") { $first = 4;}
    when("five") { $first = 5;}
    when("six") { $first = 6;}
    when("seven") { $first = 7;}
    when("eight") { $first = 8;}
    when("nine") { $first = 9;}
  }
  given($last){
    when("one") { $last = 1;}
    when("two") { $last = 2;}
    when("three") { $last = 3;}
    when("four") { $last = 4;}
    when("five") { $last = 5;}
    when("six") { $last = 6;}
    when("seven") { $last = 7;}
    when("eight") { $last = 8;}
    when("nine") { $last = 9;}
  }

  #print ": first $first, last $last\n";
  my $value = $first * 10 + $last;
  $sum += $value;

}

print "total is $sum\n";
