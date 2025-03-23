// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Demo{
    mapping(address=>uint) public tokens;

    address[] public arr;
    function transfer(uint amount) public{
        tokens[msg.sender]=amount;
        arr.push(msg.sender);
    }
}
