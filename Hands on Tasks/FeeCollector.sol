// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FeeCollector {
    address public owner; // Determined owner variable as address type.
    uint256 public balance;

    constructor() {
        owner = msg.sender;
    }

    receive() payable external {
        balance += msg.value;    // This function shows us the balance of the wallet. 
    }

    // This function sends funds to destination address.
    function withdraw(uint amount, address payable destAddr) public { 
        // Shows us error message if msg.sender is not owner of address.
        require(msg.sender == owner, "Only owner can withdraw!"); 
        require(amount <= balance, "Insufficient funds.");

        destAddr.transfer(amount);
        balance -= amount;
    }
}
