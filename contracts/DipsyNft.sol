// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.24;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

contract DipsyNft is ERC721URIStorage {
    using Strings for uint256;

    uint256 private tokenIdCounter;

    constructor() ERC721("dipCool", "DPC") {}

    function safeMint(address to) public{
        uint256 newTokenId = tokenIdCounter++;
        _safeMint(to, newTokenId);
    }

    function generateSVG(string memory svgImage) public pure returns (string memory) {
        bytes memory svg = abi.encodePacked(svgImage);
        return string(abi.encodePacked("data:image/svg+xml;base64,", Base64.encode(svg)));
    }

    function getTokenURI(
        string memory svgImage,
        string memory name,
        string memory description
    ) public pure returns (string memory) {
        bytes memory dataURI = abi.encodePacked(
            '{"name": "',
            name,
            '","description": "',
            description,
            '","image": "',
            generateSVG(svgImage),
            '"}'
        );
        return string(abi.encodePacked("data:application/json;base64,", Base64.encode(dataURI)));
    }
}
