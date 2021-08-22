// contracts/NFT.sol
// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    address _artist;
    address _feeToken;
    uint _feeAmount;
    
    mapping(uint => bool) public excludeList;

    constructor(
        address artist,
        address feeToken,
        uint feeAmount
        ) ERC721("Moogle Tokens", "MOG"){

        _artist = artist;
        _feeTokent = feeToken;
        _feeAmount = feeAmount;

    }

    function createToken(string memory tokenURI) public returns (uint) {
        
        _tokenIds.increment();
        uint tokenId = _tokenIds.current();

        excludeList[tokenId] = false

        _mint(_artist, tokenId);
        _setTokenURI(tokenId, tokenURI);
        
        return tokenId;

    }

    function setExcluded(uint tokenId, bool status) external {
        require(msg.sender == _artist, 'only the artist can change the exclude value');
        excludeList[tokenId] = status;
    }

    function transferFrom(
        address from, 
        address to, 
        uint tokenId
    ) public override {

        require(from != address(0x0), 'invalid from address');
        require(to != address(0x0), 'invalid to address');

        require(tokenId > 0, 'invalid tokenId');
        require(tokenId <= _tokenIds.current(), 'invalid tokenId');

        require(_isApprovedOrOwner(_msgSender(), tokenId), 'msgSender is not the owner of the token');

        if(excludeList[tokenId] == false) {
            _payTxFee(from);
        }

        _transfer(from, to, tokenId);

    }

    function _payTxFee(address from) internal {
        IERC20 token = IERC20(txFeeToken);
        token.transferFrom(from, artist, txFeeAmount);
    }

}