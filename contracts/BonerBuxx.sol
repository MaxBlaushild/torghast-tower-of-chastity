pragma solidity 0.6.2;
import 'openzeppelin-solidity/contracts/token/ERC20/ERC20.sol';


contract BonerBuxx is ERC20 {
  constructor(uint totalSupply) ERC20("Boner Buxx", "BBXX") public {
    _mint(msg.sender, totalSupply);
  }
}