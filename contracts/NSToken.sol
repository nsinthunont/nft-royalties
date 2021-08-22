// contracts/NSToken.sol
// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity ^0.8.4;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract NSToken is ERC20 {

    constructor() ERC20("NSToken", "NST") {
        _mint(msg.sender, 1000000);
    }

}