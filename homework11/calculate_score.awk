NR == 1 {
    printf "%-6s %-6s %-6s %-6s %-6s %-6s %-6s\n", $1, $2, $3, $4, $5, "총점", "평균"
}

NR > 1 {
    count++
    total = $3 + $4 + $5
    avg = total / 3.0
    
    kor_sum += $3
    eng_sum += $4
    math_sum += $5
    
    printf "%-6s %-7s %-7d %-7d %-7d %-7d %-7.1f\n", $1, $2, $3, $4, $5, total, avg
}

END {
    if (count > 0) {
        kor_avg = kor_sum / count
        eng_avg = eng_sum / count
        math_avg = math_sum / count
        
        printf "%-14s %-7.1f %-7.1f %-7.1f\n", "", kor_avg, eng_avg, math_avg
    }
}
