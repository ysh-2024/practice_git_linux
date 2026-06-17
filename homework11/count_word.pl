#!/usr/bin/perl
use strict;
use warnings;

my %word_count;

while (my $word = <>) {
    chomp $word;
    next if $word eq "";  
    $word_count{$word}++; 
}

print "--------------------------\n";
print "[단어 발생 빈도 결과]\n";
print "--------------------------\n";

foreach my $key (sort keys %word_count) {
    printf "%-15s : %d회\n", $key, $word_count{$key};
}
