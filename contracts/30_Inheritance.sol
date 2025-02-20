// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./1_Storage.sol";

contract Child is Owner{
     function isEven(uint a) public pure returns(bool){
        if(a%2==0)
           return true;
        return false;
     }
}