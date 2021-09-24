pragma solidity ^0.5.0;

import './Token.sol';

contract EthSwap {
    string public name = "EthSwap Instant Exchange";
    Token public token;
    uint public rate = 100; // Redemption rate = # of tokens they receive for 1 ether

    constructor(Token _token) public {
        token = _token;
    }

    function buyTokens() public payable {
        // Calculate the number of tokens to buy (Amount of Ethereum * Redemption rate)
        uint tokenAmount = msg.value * rate; // msg.value = how much ether was sent when this function is called
        token.transfer(msg.sender,  tokenAmount);
    }
}