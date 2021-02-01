pragma solidity 0.6.2;

import "./IKey.sol";


contract IglesiaKeyToTheCrotch is IKey {

    address public spiritTumblerMedium;

    constructor(address _spiritTumblerMedium) public {
        spiritTumblerMedium = _spiritTumblerMedium;
    }

    // The heart must be true.
    function heartTumbler() external view override returns (bool) {
        return false;
    }

    // The mind must be sharp as a knife. Return a number that satisfies
    // the eternal prison's demands
    function mindTumbler(uint agelessChallenge) external view override returns (uint) {
        return 0;
    }

    // The spirit must be rich . . . . with money. Return a token address
    // that the key will hold greater than 0 units of
    function spiritTumbler() external view override returns (address) {
        return address(0);
    }
}