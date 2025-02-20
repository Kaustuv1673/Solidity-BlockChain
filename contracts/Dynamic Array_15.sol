// SPDX-Licence-Identifier:MIT
pragma solidity >=0.5.0 <0.9.0;

contract dynamicArray{
    uint[] public arr=[1,2,3];

    function insertElement(uint element) public{
        arr.push(element);//0 1 2 3
    }

    function returnElement(uint index) public view returns(uint){
        return arr[index];
    }

    function removeLastElement() public{
        arr.pop();// 3 2 1 0
    }

    function lengthofArray() public view returns(uint){
        return arr.length;
    }

    function returnAllElements() public view returns(uint[] memory){
        return arr;
    }
}