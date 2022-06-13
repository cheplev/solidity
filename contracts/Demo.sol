// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Demo {
    //public - from any space
    //external - only from outside this contract
    //internal - from this contract and his inheritant
    //private - only from this contract

    //modifiers:

    //view - using call, read only without modify
    //pure - alos using call, can't even read :)
    string message = "hello"; // state

    //call
    function getBalance() public view returns(uint balance) {
        balance = address(this).balance;
    }

    function getMessage() external view returns(string memory) {
        return message;
    }

    function rate(uint amount) external pure returns(uint) {
        return amount * 3;
    }

    //transaction
    function setMessage(string memory newMessage) external {
        message = newMessage;
    }

    function pay() external payable {
        balance += msg.value;
    }
}