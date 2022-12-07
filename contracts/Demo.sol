// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Demo {

    string message = "hello";
    uint public balance;

    function setMessage_G0(string calldata newMessage) external {
        message = newMessage;
    }

    function pay() external payable {
        balance += msg.value;
    }

    function getBalance_8Me() public view returns (uint _balance) {
        _balance = address(this).balance;
    }
}