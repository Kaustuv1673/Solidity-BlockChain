// SPDX-Licence-Identifier:GPL -3.0
pragma solidity >=0.7.0 <0.9.0;

contract Array{
    uint[5] public arr=[1,2,3];//arr[3]=0,arr[4]=0

    function insertElement(uint index,uint element) public{
        arr[index]=element;
    }

    function returnElement(uint index) public view returns(uint){
        return arr[index];
    }

    function returnAllElements() public view returns (uint[5] memory){
        return arr;
    }
}