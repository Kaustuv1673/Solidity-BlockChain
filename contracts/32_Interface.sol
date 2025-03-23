// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

interface Calculator{
    function addition(uint a,uint b) external returns(uint);
    function subtraction(uint a,uint b) external returns(uint);
}

contract Owner is Calculator(){
    function addition(uint a,uint b) public pure returns(uint){
        return a+b;
    }
    function subtraction(uint a,uint b) public pure returns(uint){
        return a-b;
    }
}