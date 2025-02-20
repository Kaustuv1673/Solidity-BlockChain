// SPDX-Licence-Identifier:GPL -3.0
pragma solidity >=0.7.0 <0.9.0;

contract Array{
    uint[5] public arr=[1,2,3];//arr[3]=0,arr[4]=0

    //memory - Mutable case
    function multiplyby2Index0(uint[3] memory num) public pure returns(uint[3] memory){
        num[0]=num[0]*2;
        return num;
    }

    //calldata - Immutable case
    function passingArray(uint[3] calldata num) public pure returns(uint){
        uint a=num[0];
        a=a*2;
        return a;
    }

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