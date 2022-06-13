// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract String {
    address public myAddr = 0x617F2E2fD72FD9D5503197092aC168c91465E7f2;
    mapping (address => uint)
    function getBalance(address targetAddr) public view returns(uint) {
        return targetAddr.balance;
    }

    function receiveFunds() public payable {

    }

    function transferTo(address targetAddr, uint amount) public {
        address payable _to = payable(targetAddr);
        _to.transfer(amount);
    }

    string public myStr = "test";

    function demo(string memory newVal) public {
        // string memory myTempStr = "temp";
        myStr = newVal;
    }
}