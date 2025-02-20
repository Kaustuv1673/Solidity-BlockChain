// SPDX-Licence-Identifier:GPL -3.0
pragma solidity >=0.7.0 <0.9.0;

contract Assignment{
   uint[5] public arr;

   function addNumber(uint num) public{
      uint i=0;
      while(i<5 && arr[i]!=0)
        i++;
      arr[i]=num;
   }

   function countNumbers() public view returns(uint){
      return arr.length;
   }

   function getNumber(uint index) public view returns(uint){
      return arr[index];
   }

   function replaceNumber(uint index) public {
      arr[index]=index;
   }
}