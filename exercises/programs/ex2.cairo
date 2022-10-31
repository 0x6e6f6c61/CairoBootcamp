from starkware.cairo.common.uint256 import Uint256, uint256_add
from starkware.cairo.common.math import split_felt

// Modify both functions so that they increment
// supplied value and return it
func add_one(y: felt) -> (val: felt) {
    return (val=y+1,);
}

func add_one_U256{range_check_ptr}(y: Uint256) -> (val: Uint256) {
    let (num1high, num1low) = split_felt(1);
    let num1 : Uint256 = Uint256(low=num1low,high=num1high);
    let (res,_) = uint256_add(y,num1);
    return (val=res,);
}
