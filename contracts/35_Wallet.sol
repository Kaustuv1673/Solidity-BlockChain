// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Wallet{
    address public owner;
    constructor(){
        owner=msg.sender;
    }
     
    modifier onlyOwner(){
       require(msg.sender==owner,"You are not the owner");
       _;
    }

    function sendEth(address payable receiver) public payable onlyOwner(){
          receiver.transfer(msg.value);
    }
  
    modifier notOwner(){
        require(msg.sender!=owner,"You are the owner");
        _;
    }
    
    event EthReceived(address sender,uint amount);

    function sendEthtoOwner() public payable notOwner(){
         payable(owner).transfer(msg.value);
         emit EthReceived(msg.sender,msg.value);
    }

    function checkBalance() public view onlyOwner() returns(uint){
         return address(owner).balance;
    }
}