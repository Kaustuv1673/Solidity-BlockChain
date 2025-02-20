// SPDX-Licence-Identifier:GPL -3.0
pragma solidity >= 0.8.0 < 0.9.0;

contract Payable{
    address public owner;

    function sendEtherToAddress(address receiver) public payable{
        payable(receiver).transfer(msg.value);
    }

    function sendEtherToContract() public payable{

    }

    function sendEtherToContract1() public payable{

    }

    function returnBalance() public view returns(uint){
        return address(this).balance;
    }
}