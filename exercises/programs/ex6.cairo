from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin

// Implement a function that sums even numbers from the provided array
func sum_even{bitwise_ptr: BitwiseBuiltin*}(arr_len: felt, arr: felt*, run: felt, idx: felt) -> (
    sum: felt
) {
    if (arr_len == 0) {
        return (0,);
    }
    let (sum) = sum_even(arr_len - 1, arr, run, idx);
    let (t) = bitwise_and(arr[arr_len-1],1);
    let sumcalc = sum + ((1-t)*arr[arr_len - 1]);
    return (sum = sumcalc);
}
