// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Demo{

    event sendEthInformation(address sender,address receiver,uint amountSent);

    // function sendEth(address payable receiver) public payable{
    //     receiver.transfer(msg.value);
    //     emit sendEthInformation(msg.sender, receiver, msg.value);
    // }

    function sendEth(address payable receiver) public payable returns(address,address,uint){
        receiver.transfer(msg.value);
        return(msg.sender,receiver,msg.value);
    }
}