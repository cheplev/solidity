// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract Tree {
    //TX1 TX2 TX3 TX4
    bytes32[] public hashes;
    string[4] public transactions = [
        "TX1: Sherlok -> John",
        "TX2: John -> Sherlok",
        "TX3: John -> Mary",
        "TX4: Mary -> Sherlok"
    ];

    constructor() {
        for (uint i = 0; i < transactions.length; i++) {
            hashes.push(
                keccak256(
                    abi.encodePacked(transactions[i])
                )
            );
        }

        uint count = transactions.length;
        uint offset = 0;

        while(count > 0) {
            for (uint i = 0; i < count - 1; i += 2) {
                hashes.push(
                    keccak256(
                        abi.encodePacked(
                            hashes[offset + i], hashes[offset + i + 1]
                        )
                    )
                );
            }
            offset += count;
            count = count / 2;
        }

    }

    function verify(string memory transaction, uint index, bytes32 root, bytes32[] memory proof) public pure returns (bool) {
        bytes32 hash = keccak256(abi.encodePacked(transaction));

        for (uint i = 0; i < proof.length; i++) 
        {
            bytes32 element = proof[i];
            if (index % 2 == 0) {
                hash = keccak256(
                    abi.encodePacked(hash, element)
                );
            } else {
                hash = keccak256(
                    abi.encodePacked(element, hash)
                );
            }

            index = index / 2;
        }

        return hash == root;
    }

    function makeHash(string memory input) public pure returns (bytes32) {
        return keccak256(
            abi.encodePacked(input)
        );
    }
}