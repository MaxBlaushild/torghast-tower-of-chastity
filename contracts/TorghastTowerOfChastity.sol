pragma solidity 0.6.2;

import "openzeppelin-solidity/contracts/token/ERC721/IERC721.sol";
import "openzeppelin-solidity/contracts/token/ERC20/IERC20.sol";
import "./IKey.sol";


contract TorghastTowerOfChastity {

    address public wizardBonerAddress;

    constructor(address _wizardBonerAddress) public {
        wizardBonerAddress = _wizardBonerAddress;
    }

    function letTheHogOut(uint wizardBonerId, address keyAddress) public returns (bool) {

        // First, we test the stregth of the heart
        require(isTrueOfHeart(keyAddress), "The heart was not true");

        // Next, we test the brilliance of the mind
        require(isSharpOfMind(keyAddress), "The mind was not strong enough");

        //Finally, we test the richness of the spirit
        require(isRichOfSpirit(keyAddress), "The spirit was lacking");

        //We check if the hog is locked in our dungeons
        require(isWizardBonerIncarcerated(wizardBonerId), "We don't have the hog you're looking for");

        // We give the hog to serve the strong, proven soul!
        return freeWizardBonerById(wizardBonerId);
    }

    function isTrueOfHeart(address keyAddress) public view returns (bool) {
        IKey key = IKey(keyAddress);
        return key.heartTumbler();
    }

    function isSharpOfMind(address keyAddress) public view returns (bool) {
        IKey key = IKey(keyAddress);
        return key.mindTumbler(7) == 42;
    }

    function isRichOfSpirit(address keyAddress) public view returns (bool) {
        IKey key = IKey(keyAddress);
        address tokenAddress = key.spiritTumbler();
        IERC20 token = IERC20(tokenAddress);
        return token.balanceOf(address(key)) > 0;
    }

    function isWizardBonerIncarcerated(uint wizardBonerId) public view returns (bool) {
        IERC721 wizardBoner = IERC721(wizardBonerAddress);
        address hogOwner = wizardBoner.ownerOf(wizardBonerId);
        return hogOwner == address(this);
    }

    function freeWizardBonerById(uint wizardBonerId) internal returns (bool) {
        IERC721 wizardBoner = IERC721(wizardBonerAddress);
        wizardBoner.transferFrom(address(this), msg.sender, wizardBonerId);
        return true;
    }
}