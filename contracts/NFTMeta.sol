// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./MintableMeta.sol";

contract NFTMeta is ERC721, MintableMeta {
    string __baseURI;

    constructor(
        string memory _name,
        string memory _symbol,
        string memory _initBaseURI,
        address _imx
    ) ERC721(_name, _symbol) MintableMeta(_imx) {
        __baseURI = _initBaseURI;
    }

    function _mintFor(
        address user,
        uint256 id,
        bytes memory
    ) internal override {
        _safeMint(user, id);
    }

    function _baseURI() internal view override(ERC721) returns (string memory) {
        return __baseURI;
    }

    function setBaseURI(string memory newBaseURI) external onlyOwner {
        __baseURI = newBaseURI;
    }
}
