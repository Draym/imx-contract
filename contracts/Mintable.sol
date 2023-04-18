// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./IMintable.sol";
import "./utils/Minting.sol";

abstract contract Mintable is Ownable, IMintable {
    address public imx;

    constructor(address _imx) {
        imx = _imx;
    }

    modifier onlyOwnerOrIMX() {
        require(_msgSender() == imx || _msgSender() == owner(), "only allow owner or IMX");
        _;
    }

    function extractTokenId(bytes calldata blob) internal pure returns (uint256) {
        int256 index = Bytes.indexOf(blob, ":", 0);
        require(index >= 0, "Separator must exist");
        return Bytes.toUint(blob[1 : uint256(index) - 1]);
    }

    function mintFor(
        address user,
        uint256 quantity,
        bytes calldata mintingBlob
    ) external override onlyOwnerOrIMX {
        require(quantity == 1, "invalid quantity");
        uint tokenID = extractTokenId(mintingBlob);
        _mintFor(user, tokenID, "");
    }

    function _mintFor(
        address to,
        uint256 id,
        bytes memory blueprint
    ) internal virtual;
}
