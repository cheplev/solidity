// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

//Merkle tree

contract Tree {
    bytes32[] public hashes;
    string[4] transacions = [
        "TX1: Sherlock -> John",
        "TX2: John -> Sherlcok",
        "TX3: John -> Mary",
        "TX4: Mary -> Sherlock"
    ];

    constructor() {
        for (uint i = 0; i < transacions.length; i++) {
            hashes.push(makeHash(transacions[i]));
        }

        uint count = transacions.length;
        uint offset = 0;

        while(count > 0) {
            for (uint i = 0; i < count - 1; i += 2) {
                hashes.push( keccak256(
                    abi.encodePacked(
                        hashes[offset + i], hashes[offset + i + 1] 
                    )
                ));
            }
            offset += count;
            count / 2;
        }
    }

    function encode(string memory input)  public pur e returns(bytes memory) {
        return abi.encodePacked(input);
    }

    function makeHash(string memory input) public pure returns(bytes32) {
        return keccak256(
            encode(input)
        );
    }
}
