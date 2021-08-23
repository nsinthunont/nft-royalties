# NFT Royalties

## Introduction
This repo contains a template smart contract to create an NFT that pays royalties to the original artist each time it is transacted in the future. This feature is an extremely important one to have as many artists are currently struggling to monetize. In an ideal scenario, the royalty scheme can be customized at the NFT level. 

## Openzeppelin
This smart contract relies on Openzeppelin's ERC721 standard for NFTs. There is also another ERC20 smart contract for a test token called NSToken (this can be replaced with any token)


## Setup dependencies
To install all the dependencies in a all project:
```
npm install --save ethers hardhat @nomiclabs/hardhat-waffle ethereum-waffle chai @nomiclabs/hardhat-ethers web3modal @openzeppelin/contracts 
```
We will also want to install some dev dependencies for testing purposes
```
npm install --save-dev @openzeppelin/test-helpers @nomiclabs/hardhat-web3 web3
```
Don't forget to modify the hardhat.config.js file by adding the following to the top or else the test-helpers will not function properly
```
require("@nomiclabs/hardhat-web3");
```

## Usage
To test the smart contracts using the provide test file:
```
npx hardhat test
```


## Future
There are several upgrades that are available to the current template including:
* The royalty fee can be paid in any token currency that is equivalent to the fee which can be denominated in ETH (i.e. assume fee is 1 ETH and today the price of 1 ETH = 10 LINK then the royalty fee can either be paid using 1 ETH or 10 LINK)
* Allow either the buyer or the seller of the NFT to cover the fee cost

