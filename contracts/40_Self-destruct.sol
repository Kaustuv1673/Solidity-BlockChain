// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Transfer{
    address payable public manager;
    bool destroyed;

    constructor(){
        manager=payable(msg.sender);
    }

    modifier isNOTdestroyed{
        require(destroyed==false,"Contract is destroyed");
        _;
    }

    function sendEtherContract() public payable isNOTdestroyed{

    }

    function contractBalance() public view isNOTdestroyed returns(uint){
        return address(this).balance;
    }

    receive() external payable {

    }

    function destroy() public isNOTdestroyed{
        require(msg.sender==manager,"You are not the manager");
        manager.transfer(contractBalance());
        destroyed=true;
    }

    // function destroy() public{
    //     require(msg.sender==manager,"You are not the manager");
    //     selfdestruct(manager);
    // }


}