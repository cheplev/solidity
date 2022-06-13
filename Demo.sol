// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyShop {
    address public owner;
    mapping (address => uint) public payments;

    constructor() {
        owner = msg.sender;
    }

    function payForItem() public payable {
        payments[owner] = msg.value;
    }

    function withdrawAll() public {
        address payable _to = payable(owner);
        addressaddress(this);
        _to.transfer();
    }
}