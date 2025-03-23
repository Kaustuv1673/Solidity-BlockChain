// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./Math.sol";

contract Demo{
      //More Widely used
   using Maths for uint256;

   function add(uint a,uint b) public pure returns(uint){
     return a.addition(b);
   }

   function sub(uint a,uint b) public pure returns(uint){
     return a.subtraction(b);
   }

      //Alternate Method
    //   function add(uint a,uint b) public pure returns(uint){
    //      return Maths.addition(a,b);
    //   }

    //   function sub(uint a,uint b) public pure returns(uint){
    //     return Maths.subtraction(a,b);
    //   }
}