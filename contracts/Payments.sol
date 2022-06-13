// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Payments {
    struct Payment {
        uint amount;
        uint timestamp;
        address from;
        string message;
    }

    struct Balance {
        uint totalPayments;
        mapping(uint => Payment) payments;
    }

    function currentBalance() public view returns(uint) {
        return address(this).balance;
    }

    function getPayments(address __addr, uint _index) public view returns(Payment memory) {
        return balances[__addr].payments[_index];
    }

    mapping(address => Balance) public balances;

    function pay(string memory message) public payable {
        balances[msg.sender].totalPayments++;

        uint paymentNum = balances[msg.sender].totalPayments;

        Payment memory newPayment = Payment(
            msg.value,
            block.timestamp,
            msg.sender,
            message
        );

        balances[msg.sender].payments[paymentNum] = newPayment;
    }
}