// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
// import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

contract HappyNFT is ERC721URIStorage  {
    using Strings for uint256;
    // using Counters for Counters.Counter;
    uint256 private _tokenIds;

    mapping(uint256 => uint256) public tokenIdToLevels;

    constructor() ERC721 ("HappyNFT", "HNF"){

        
    }

    function generateCharacter(uint256 tokenId) public returns(string memory){

    bytes memory svg = abi.encodePacked(
        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200">',
        '<circle cx="100" cy="100" r="80" fill="#ffe0bd" />',
        '<circle cx="70" cy="80" r="10" fill="#000" />',
        '<circle cx="130" cy="80" r="10" fill="#000" />',
        '<rect x="50" y="70" width="100" height="20" fill="black" />',
        '<rect x="60" y="60" width="80" height="40" fill="white" />',
        '<path d="M 60 120 q 40 30 80 0" fill="none" stroke="#000" stroke-width="6" />',
        '<text>Stay Happy</text>'
        '</svg>'
            );
    return string(
        abi.encodePacked(
            "data:image/svg+xml;base64,",
            Base64.encode(svg)
            )    
        );
    }

    
    function getTokenURI(uint256 tokenId) public returns (string memory){
    bytes memory dataURI = abi.encodePacked(
        '{',
            '"name": "Happy NFT',
            '"description": "Remember to always smile",',
            '"image": "',
        '}'
    );
    return string( 
        abi.encodePacked(
            "data:application/json;base64,",
            Base64.encode(dataURI)
            )
        );
    }

 
    function mint() public {
        _safeMint(msg.sender, _tokenIds);
        _setTokenURI(_tokenIds, getTokenURI(_tokenIds));
        _tokenIds++;
    }

    
}