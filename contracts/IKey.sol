pragma solidity 0.6.2;


interface IKey {
    function heartTumbler() external view returns (bool);
    function mindTumbler(uint _agelessChallenge) external view returns (uint);
    function spiritTumbler() external view returns (address);
}