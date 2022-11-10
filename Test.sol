// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;


contract Test {
        
    function graduate() public returns(bytes memory) {
        bytes memory secret;
        assembly {
            mstore(0x80, 0x636f6e67726174756c6174696f6e730000000000000000000000000000000000)
            secret := mload(0x80)
        }

        return bytes(secret);
    }
}