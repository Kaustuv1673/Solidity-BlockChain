// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Addition{
    uint public num;
    function addition() public{
        num=10;
    }
    function subtraction() public{
        num=20;
    }
    fallback() external{
        num=1;
    }
}