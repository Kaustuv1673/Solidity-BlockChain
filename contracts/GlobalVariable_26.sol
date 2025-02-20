// SPDX-Licence-Identifier:GPL -3.0
pragma solidity >=0.5.0 <0.9.0;

contract globalVariable{
    // function returntime() public view returns(uint){
    //     return block.timestamp;
    // }

    // function callerAddress() public view returns(address){
    //     return msg.sender;
    // }

    function ethSendByUser() public payable returns(uint){
        return msg.value;
    }
}