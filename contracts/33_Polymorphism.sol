// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Demo{
    function addition(uint a,uint b) public pure returns(uint){
        return a+b;
    }
    function addition(uint a,string calldata b) public pure returns(uint){
        return a;
    }
}