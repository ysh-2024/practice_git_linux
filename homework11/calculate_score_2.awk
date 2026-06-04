NR == 1 {
    printf "%-8s %-8s ", $1, $2
    for (i = 3; i <= NF; i++) {
        printf "%-6s ", $i
    }
    printf "%-6s %-6s\n", "총점", "평균"
    max_nf = NF
}

NR > 1 {
    student_sum = 0
    printf "%-8s %-8s ", $1, $2
    for (i = 3; i <= NF; i++) {
        printf "%-6d ", $i
        student_sum += $i
        subject_sum[i] += $i
    }
    student_avg = student_sum / (NF - 2)
    printf "%-6d %-6.1f\n", student_sum, student_avg
    student_count++
}

END {
    printf "%-8s %-8s ", "", ""
    for (i = 3; i <= max_nf; i++) {
        subj_avg = subject_sum[i] / student_count
        printf "%-6.1f ", subj_avg
    }
    printf "\n"
}
