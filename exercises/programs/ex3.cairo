from starkware.cairo.common.math import unsigned_div_rem

// Perform and log output of simple arithmetic operations
func simple_math{range_check_ptr}() {
    // adding 13 +  14
    let sum1 : felt = 13+14;
    %{print(f"13 + 14 is {ids.sum1}")%}
    // multiplying 3 * 6
    let mul1 : felt = 3*6;
    %{ print(f"3 * 6 is {ids.mul1}")%}
    // dividing 6 by 2
    let div1 : felt = 6/2;
    %{ print(f"6 / 2 is {ids.div1}")%}
    // dividing 70 by 2
    let div2 : felt = 70/2;
    %{ print(f"70 / 2 is {ids.div2}")%}
    // dividing 7 by 2
    let a : felt = 7;
    let b : felt = 2;
    let (q, r) = unsigned_div_rem(a,b);
    %{ print(f"7 / 2 is {ids.q} and {ids.r}/{ids.b}")%}
    return ();
}
