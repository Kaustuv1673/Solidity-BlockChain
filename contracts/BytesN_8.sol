// SPDX-Licence-Identifier:GPL -3.0
pragma solidity 0.8.0;

contract BytesDataType{
    bytes1 public n1="a";
    bytes2 public n2="ab";
    bytes3 public n3="abc";
    //Maximum value
    bytes32 public n4="";

    function getter() public view returns(bytes1){
        return n1;
    }

    function getterIndex(uint index) public view returns(bytes1){
        return n3[index];
    }
}