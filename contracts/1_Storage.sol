// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Owner {
   address public manager;
   constructor(){
      manager=msg.sender;
   }
   function add(uint a,uint b) public pure returns(uint){
       return a+b;
   }

   function sub(uint a,uint b) public pure returns(uint){
    return a-b;
   }

   function mul(uint a,uint b) public pure returns(uint){
    return a*b;
   }

   function div(uint a,uint b) public pure returns(uint){
    return a/b;
   }  
}

// contract otherContract{
//     Calculator calc=new Calculator();//create Storage contract instance
//     address public manager=calc.manager();

//     function returnObj() public view returns(Calculator){
//         return calc;
//     }
    
// }