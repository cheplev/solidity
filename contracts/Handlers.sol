// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Handlers {
    
    address owner;

    constructor()
    {
        owner = msg.sender;
    }

    function pay() external payable {
        emit Paid(msg.sender, msg.value, block.timestamp)   
    }

    event Paid(address _from, uint _amount, uint _timestamp);

    modifier onlyOwner() {
        require(msg.sender == owner, "you are not an owner!");
        require(_to != address(0), "incorrect address");
        _; // continue to function
    }

    function withdraw(address payable _to) external onlyOwner(_to) {
        // Panic if false
        assert(msg.sender == owner);
        
        //require(msg.sender == owner, "you are not an owner!");
        /* the same
        if (msg.sender != owner) {
            revert("you are not an owner!");
        }*/

        _to.transfer(address(this).balance);
    }
}