pragma solidity 0.6.2;
import 'openzeppelin-solidity/contracts/token/ERC721/ERC721.sol';
import "openzeppelin-solidity/contracts/access/Ownable.sol";


contract WizardBoner is ERC721, Ownable {
  constructor() ERC721("Wizard Boners", "WBNR") public { }

  uint256 private _currentTokenId = 0;

  function mintTo(address _to, string memory metadataHash) public onlyOwner {
    uint256 newTokenId = _getNextTokenId();
    _mint(_to, newTokenId);
    _setTokenURI(newTokenId, metadataHash);
    _incrementTokenId();
  }

  function _getNextTokenId() private view returns (uint256) {
    return _currentTokenId.add(1);
  }

  function _incrementTokenId() private  {
    _currentTokenId++;
  }

  function baseTokenURI() public pure returns (string memory) {
    return "https://ipfs.io/ipfs/";
  }

  function contractURI() public pure returns (string memory) {
    return "https://ipfs.io/ipfs/Qmbi2fGXqN8vAQyjoXnLVwE5VuyqB5R3bYDisEbbBcZwxD";
  }
}