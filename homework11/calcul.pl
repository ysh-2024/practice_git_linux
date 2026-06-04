#!/usr/bin/perl
use strict;
use warnings;

my @subject_sum;
my $student_count = 0;
my $max_fields = 0;

while (my $line = <>) {
    chomp $line;
    my @fields = split(/\s+/, $line);
    next if @fields == 0;

    my $num_fields = scalar(@fields);
    if ($num_fields > $max_fields) {
        $max_fields = $num_fields;
    }

    if ($. == 1) {
        printf "%-8s %-8s ", $fields[0], $fields[1];
        for (my $i = 2; $i < $num_fields; $i++) {
            printf "%-6s ", $fields[$i];
        }
        printf "%-6s %-6s\n", "총점", "평균";
    } else {
        my $student_sum = 0;
        printf "%-8s %-8s ", $fields[0], $fields[1];

        for (my $i = 2; $i < $num_fields; $i++) {
            printf "%-6d ", $fields[$i];
            $student_sum += $fields[$i];
            $subject_sum[$i] += $fields[$i];
        }

        my $student_avg = $student_sum / ($num_fields - 2);
        printf "%-6d %-6.1f\n", $student_sum, $student_avg;
        
        $student_count++;
    }
}

if ($student_count > 0) {
    printf "%-8s %-8s ", "", "";
    for (my $i = 2; $i < $max_fields; $i++) {
        my $subj_avg = $subject_sum[$i] / $student_count;
        printf "%-6.1f ", $subj_avg;
    }
    printf "\n";
}
