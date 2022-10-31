// Return summation of every number below and up to including n
func calculate_sum(n: felt) -> (sum: felt) {
    if (n == 1) {
        return (1,);
    }

    let (sum) = calculate_sum(n = n - 1);
    let sumcalc = sum + n;
    return(sum = sumcalc);
}
