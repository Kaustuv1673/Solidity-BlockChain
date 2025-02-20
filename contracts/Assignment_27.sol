// SPDX-Licence-Identifier:GPL -3.0
pragma solidity >= 0.8.0 < 0.9.0;

//Create a function that stores the address, eth value, and time of
//a user who is calling the function

contract Assignment{
    struct details{
        address add;
        uint eth;
        uint time;
    }

    details[] public record;

    function sendEth() public payable{
        record.push(details(msg.sender,msg.value,block.timestamp));
    }
}