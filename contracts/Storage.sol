// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Storage {
    // keccak256(key - slot)
    mapping(uint => uint) public aa; // slot [0]
    mapping(address => uint) public bb; // slot [1]

    uint[] public cc; // slot [2]

    uint8 public a = 7; // 1 byte
    uint16 b = 10; // 2 bytes
    address public c = 0xe2049119aF8F24D9F6039f3C116e48f61A0D974f; // 20 bytes
    bool public d = true; // 1 byte
    uint64 public e = 15; // 8 bytes
    // 32 bytes -> slot [3]
    // 0x000000000000000f01e2049119af8f24d9f6039f3c116e48f61a0d974f000a07
    // 0x000000000000000f -> 15, 01 -> d, e2049119af8f24d9f6039f3c116e48f61a0d974f -> c, 000a -> b, 07 -> a

    uint256 public f = 200; // 32 bytes -> slot [4]

    uint8 public g = 40; // 1 byte -> slot [5] = !expensive definition!

    uint256 public h = 789; // 32 bytes -> slot [6]

    constructor() {
        cc.push(1);
        cc.push(10);
        cc.push(100);

        aa[2] = 4;
        aa[3] = 10;
        bb[0xf8C0EB9D5D7E0e9e40D5738C532842B2990096a5] = 100;
    }
}

// 0x000000000000000000000000f8C0EB9D5D7E0e9e40D5738C532842B2990096a50000000000000000000000000000000000000000000000000000000000000001

// 0000000000000000000000000000000000000000000000000000000000000001

// 29102676481673041902632991033461445430619272659676223336789171408008386403024
