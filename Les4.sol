// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Les4 {
    //Struct

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

    //Array 
    // uint[10] public items;

    // function demo() public {
    //     items[0] = 100;
    // }

    //Enum
    // enum Status {Paid, Delivered, Received }
    // Status public currentStatus;

    // function pay() public {
    //     currentStatus = Status.Paid;
    // }

    // function delivered() public {
    //     currentStatus = Status.Delivered;
    // } 

    // function received() public {
    //     currentStatus = Status.Received;
    // }
}