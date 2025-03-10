%lang starknet
from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.math import unsigned_div_rem

// Using binary operations return:
// - 1 when pattern of bits is 01010101 from LSB up to MSB 1, but accounts for trailing zeros
// - 0 otherwise

// 000000101010101 PASS
// 010101010101011 FAIL

func pattern{bitwise_ptr: BitwiseBuiltin*, range_check_ptr}(
    n: felt, idx: felt, exp: felt, broken_chain: felt
) -> (true: felt) {
    let (q,r) = unsigned_div_rem(n,2);
    if (q == 0) {
      return (true=1);
    }
    %{ print(ids.r, ids.idx, ids.exp, ids.broken_chain, ids.n) %}

    if (exp == 0) {
        //test last bit for 1 or 0. if r = last bit = 1 xor 1 => 0, 0 xor 1 => 1
        let (bittest) = bitwise_xor(r, 1);
        let (first) = pattern(q,bittest,exp+1,broken_chain);
        return (true=first);
    }
    //if (r == idx) {
    //    let (next) = pattern(shift_n, xor_idx, exp+1, 0);
    //    return (true=next);
    //}
    let (bittest) = bitwise_and(r,1);

    let (true) = pattern(q,bittest,exp+1,broken_chain);
    return(true=true);
}
