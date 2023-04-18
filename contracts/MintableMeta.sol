// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./IMintable.sol";
import "./utils/Minting.sol";

abstract contract MintableMeta is Ownable, IMintable {
    address public imx;
    mapping(uint256 => bytes) public blueprints;

    constructor(address _imx) {
        imx = _imx;
    }

    modifier onlyOwnerOrIMX() {
        require(_msgSender() == imx || _msgSender() == owner(), "only allow owner or IMX");
        _;
    }

    function mintFor(
        address user,
        uint256 quantity,
        bytes calldata mintingBlob
    ) external override onlyOwnerOrIMX {
        require(quantity == 1, "invalid quantity");
        (uint256 id, bytes memory blueprint) = Minting.split(mintingBlob);
        _mintFor(user, id, blueprint);
        blueprints[id] = blueprint;
    }

    function _mintFor(
        address to,
        uint256 id,
        bytes memory blueprint
    ) internal virtual;
}
