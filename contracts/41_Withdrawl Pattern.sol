// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Withdrawl{
   address payable public richest;
   uint public max;
   mapping(address=>uint) public richAddresses;

   constructor() payable{
       richest=payable(msg.sender);
       max=msg.value;
       richAddresses[richest]=msg.value;
   }

   function sendEther() public payable{
      require(msg.value>max,"You are not the richest");
      richest=payable(msg.sender);
      max=msg.value;
      richAddresses[richest]=msg.value;
   }

   function withdraw() public{
      uint amount=richAddresses[msg.sender];
      richAddresses[msg.sender]=0;
      payable(msg.sender).transfer(amount);
   }
}